<?php

namespace App\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Helper\Table;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Question\ChoiceQuestion;

class InstallCommand extends Command
{
    private $options = [
        'ZFS' => false,
        'NFS-Ganesha' => false,
        'ISCSI' => false,
        'Glusterfs' => false,
    ];

    protected function configure()
    {
        $this
            ->setName('install');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        again:
        $this->displayOptionsInTable($output);

        $helper = $this->getHelper('question');
        $question = new ChoiceQuestion(
            '',
            array_merge(['[done]'], array_keys($this->options)),
            0
        );

        $option = $helper->ask($input, $output, $question);

        if ($option !== '[done]') {

            $this->options[$option] = !$this->options[$option];

            goto again;
        }

        dump($this->options);
    }

    protected function displayOptionsInTable(OutputInterface $output): void
    {
        $table = new Table($output);

        $i = 1;
        foreach ($this->options as $option => $boolean) {
            $table->addRow([$i++, "<fg=blue>{$option}</>", '<fg='. ($boolean ? 'green' : 'red') .'>'.var_export($boolean, true).'</>']);
        }

        $table->render();
    }
}
