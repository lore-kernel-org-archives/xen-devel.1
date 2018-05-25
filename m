From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/5] x86: split out cpuid objects and helpers
Date: Fri, 25 May 2018 10:49:12 +0100
Message-ID: <20180525094912.zkwalyemsuutue2s@citrix.com>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-3-wei.liu2@citrix.com>
 <20180525094104.5ogk4qzcya5pfucc@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=alxt=im=citrix.com=prvs=6765399a5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fM9Lq-0005uB-0Y
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 09:49:34 +0000
Content-Disposition: inline
In-Reply-To: <20180525094104.5ogk4qzcya5pfucc@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, sergey.dyasli@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMjUsIDIwMTggYXQgMTE6NDE6MDRBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIE1heSAyNCwgMjAxOCBhdCAwNTowNToxOVBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gVGhleSBhcmUgbW92ZWQgdG8gYSBuZXcgaGVhZGVyIHdoaWNoIGlzIGdv
aW5nIHRvIGJlIGNvbnN1bWVkIGJ5IGJvdGgKPiA+IHRoZSBoeXBlcnZpc29yIGFuZCB0b29sc3Rh
Y2suCj4gPiAKPiA+IENyZWF0ZSBhIG5ldyBkaXJlY3RvcnkgZm9yIHRoaXMga2luZCBvZiBoZWFk
ZXJzIGluIGFudGljaXBhdGlvbiBvZgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF50aGF0Pwo+ID4gbW9yZSB3aWxsIGNv
bWUuCj4gPiAKPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiBDYzogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gPiAKPiA+IEFueSBzdWdnZXN0aW9uIG9uIHRoZSBkaXJlY3Rvcnkg
bmFtZT8KPiA+IC0tLQo+ID4gIHhlbi9pbmNsdWRlL2FzbS14ODYvYXJjaC1zaGFyZWQvY3B1aWQu
aCB8IDIxMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIHhlbi9pbmNsdWRl
L2FzbS14ODYvY3B1aWQuaCAgICAgICAgICAgICB8IDIxMCArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gCj4gSSB3b3VsZCBoYXZlIHBsYWNlZCB0aG9zZSBpbnNpZGUgb2Y6Cj4gCj4g
eGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWlkLmgKPiAKPiBQcm90ZWN0ZWQgd2l0aCBh
ICNpZiBkZWZpbmVkKF9fWEVOX18pIHx8IGRlZmluZWQoX19YRU5fVE9PTFNfXyk/Cj4gCgpJIGVu
dmlzaW9uIHRoaXMgaXMgZ29pbmcgdG8gZ3JvdyBpbnRvIGxpYmNwdWlkIG9yIHNvbWV0aGluZywg
anVzdCBsaWtlCmxpYmVsZi4KCkFsc28gdGhpcyBpc24ndCBzb21lIHNvcnQgb2YgaW50ZXJmYWNl
IGJldHdlZW4gSFYgYW5kIHRvb2xzdGFjayAtLSB0aGUKaW50ZXJmYWNlIHdvcmtzIG9uIHNlcmlh
bGlzZWQgZGF0YS4gUHV0dGluZyB0aGUgaW50ZXJuYWwgcmVwcmVzZW50YXRpb24KaW4gcHVibGlj
IGhlYWRlciB3b3VsZCBiZSB3cm9uZy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
