From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 10/15] argo: implement the notify op
Date: Tue, 15 Jan 2019 09:06:16 +0100
Message-ID: <20190115080616.o6o22qvcrdpwddpf@mac>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-11-git-send-email-christopher.w.clark@gmail.com>
 <CAPLaKK4qaUb7nky6AueJbA1LJfm9fHtw0G_9d0i44Ja2UvOPrA@mail.gmail.com>
 <CACMJ4Gbq4-hE1+eEd3XxQorG_cw57Atz6GcNE+10erZ1osF=uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2vyh=PX=citrix.com=prvs=911eac428=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gjJju-0004UI-FC
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 08:06:26 +0000
Content-Disposition: inline
In-Reply-To: <CACMJ4Gbq4-hE1+eEd3XxQorG_cw57Atz6GcNE+10erZ1osF=uw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgMTA6NTM6NTRQTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gT24gVGh1LCBKYW4gMTAsIDIwMTkgYXQgNDoyMiBBTSBSb2dlciBQYXUgTW9u
bsOpIDxyb3lnZXJAZnJlZWJzZC5vcmc+IHdyb3RlOgo+ID4KPiA+ICBPbiBNb24sIEphbiA3LCAy
MDE5IGF0IDg6NDQgQU0gQ2hyaXN0b3BoZXIgQ2xhcmsKPiA+IDxjaHJpc3RvcGhlci53LmNsYXJr
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ICsKPiA+ID4gKyAgICBhcmdvX2RwcmludGsoImZpbGxf
cmluZ19kYXRhOiBlbnQucmluZy5kb21haW49JXUsZW50LnJpbmcucG9ydD0leFxuIiwKPiA+ID4g
KyAgICAgICAgICAgICAgICAgZW50LnJpbmcuZG9tYWluX2lkLCBlbnQucmluZy5wb3J0KTsKPiA+
ID4gKwo+ID4gPiArICAgIGVudC5mbGFncyA9IDA7Cj4gPgo+ID4gUGxlYXNlIG1lbXNldCBlbnQg
dG8gMCBvciBpbml0aWFsaXplIGl0IHRvIHsgfSwgb3IgZWxzZSB5b3UgYXJlCj4gPiBsZWFraW5n
IGh5cGVydmlzb3Igc3RhY2sgZGF0YSB0byB0aGUgZ3Vlc3QgaW4gdGhlIHBhZGRpbmcgZmllbGQu
Cj4gCj4gb2sgLSBJJ3ZlIGFkZGVkIHRoZSBpbml0aWFsaXplciwgdGhhbmtzLgo+IFdhcyBpdCBy
ZWFsbHkgbGVha2luZyBzdGFjayBkYXRhIHRob3VnaCBiZWNhdXNlIHRoZSBzdHJ1Y3Qgc2hvdWxk
IGhhdmUKPiBiZWVuIGZ1bGx5IHBvcHVsYXRlZCwgaW5jbHVkaW5nIHRoZSBwYWRkaW5nIGZpZWxk
LCB3aXRoIHRoZQo+IF9fY29weV9mcm9tX2d1ZXN0IGFib3ZlPwoKVGhhdCdzIG15IGJhZCwgdGhl
cmUgd2FzIG5vIGxlYWsgaGVyZS4gSSBzb21laG93IG1pc3NlZCB0aGUKY29weV9mcm9tX2d1ZXN0
IGFib3ZlLCBldmVuIHdoZW4gSSBtYWRlIGEgY29tbWVudCBvbiBpdC4gUGxlYXNlIGxlYXZlCnRo
ZSBjb2RlIGFzLWlzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
