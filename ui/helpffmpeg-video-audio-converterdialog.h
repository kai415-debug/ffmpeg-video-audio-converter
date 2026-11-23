/*  ffmpeg-video-audio-converter - a C++/Qt5 gui frontend for ffmpeg
 *  Copyright (C) 2011-2019 Maikel Llamaret Heredia <llamaret@webmisolutions.com>
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef HELPffmpeg-video-audio-converterDIALOG_H
#define HELPffmpeg-video-audio-converterDIALOG_H

#include <QDialog>

namespace Ui {
    class Helpffmpeg-video-audio-converterDialog;
}

class Helpffmpeg-video-audio-converterDialog : public QDialog
{
    Q_OBJECT

public:
    explicit Helpffmpeg-video-audio-converterDialog(QWidget *parent = nullptr);
    ~Helpffmpeg-video-audio-converterDialog();

private:
    Ui::Helpffmpeg-video-audio-converterDialog *ui;
};

#endif // HELPffmpeg-video-audio-converterDIALOG_H
