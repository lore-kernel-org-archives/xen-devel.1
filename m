From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v4 04/14] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Tue, 15 Jan 2019 14:15:46 +0000
Message-ID: <23613.60178.772883.142077@mariner.uk.xensource.com>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
 <1547544466-21135-5-git-send-email-christopher.w.clark@gmail.com>
 <20190115122947.gnhxdr3x7se6tiat@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3FZy=PX=citrix.com=prvs=911442f07=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gjPVu-000800-1N
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 14:16:22 +0000
In-Reply-To: <20190115122947.gnhxdr3x7se6tiat@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjQgMDQvMTRdIGFyZ286IGluaXQs
IGRlc3Ryb3kgYW5kIHNvZnQtcmVzZXQsIHdpdGggZW5hYmxlIGNvbW1hbmQgbGluZSBvcHQiKToK
PiBPbiBUdWUsIEphbiAxNSwgMjAxOSBhdCAwMToyNzozNkFNIC0wODAwLCBDaHJpc3RvcGhlciBD
bGFyayB3cm90ZToKPiA+ICsgICAgLyogY2FjaGVkIHR4IHBvaW50ZXIgbG9jYXRpb24sIHByb3Rl
Y3RlZCBieSBMMyAqLwoKSSBoYXZlIG5vdCBiZWVuIGZvbGxvd2luZyB0aGlzIGluIGRldGFpbC4g
IEJ1dCBJIHNhdyB0aGlzIGdvIHBhc3QgYW5kCkkgd2FudGVkIHRvIGNvbW1lbnQgb24gdGhlIGxv
Y2sgaGFuZGxpbmcgaXNzdWUsIGJ1dCBzdGVwcGluZyBiYWNrIGEKYml0LgoKSSBhcHBsYXVkIHRo
ZXNlIGRldGFpbGVkIGRlc2NyaXB0aW9ucyBvZiB3aGF0IGxvY2sgaXMgcHJvdGVjdGVkIGJ5Cndo
YXQsIGFuZCB3aGF0IHRoZSBydWxlcyBhcmUsIHdoaWNoIGFyZSBmb3VuZCBpbiB0aGVzZSBjb21t
ZW50cy4gIE11Y2gKb2YgdGhlIGV4aXN0aW5nIGh5cGVydmlzb3IgY29kZSBpcyBtdWNoIGxlc3Mg
ZXhwbGljaXQgYW5kIHRoaXMgaXMgYQpyZWN1cnJlbnQgc291cmNlIG9mIGJ1Z3MuICBXaGF0IEkg
c2VlIGhlcmUgaXMgbXVjaCBtb3JlIGxpa2UgaG93CnRoaW5ncyBvdWdodCB0byBiZS4KCldlIHJl
dmlld2Vycy9tYWludGFpbmVycy9jb21taXR0ZXJzIHNob3VsZCBiZSBjYXJlZnVsIHRoYXQgdGhp
cwphdHRlbnRpb24gaXMgcHJvcGVybHkgcmV3YXJkZWQuICBVbmRlciB0aGUgY2lyY3Vtc3RhbmNl
cyBJIHdvdWxkCnByb2JhYmx5IHN1cHBvcnQgYSBmcmVlemUgZXhjZXB0aW9uLCBhbHRob3VnaCBv
ZiBjb3Vyc2UgdGhlIGZpbmFsCmRlY2lzaW9uIGlzIHdpdGggSnVlcmdlbi4KCkknbGwgbGVhdmUg
dGhlIGRldGFpbGVkIGNvbW1lbnRhcnkgdG8gb3RoZXJzLgoKUmVnYXJkcywKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
