From: Juergen Gross <jgross@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 09:39:31 +0200
Message-ID: <94e5c70c-4f6b-6abc-0c18-ee6225372e2d@suse.com>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDQvMTggMDk6MzEsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFdlZCwgMjAxOC0w
NC0xMSBhdCAwMDo1OSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4+IFtBZGRpbmcgQW5k
cmV3LCBub3QgYmVjYXVzZSBJIGV4cGVjdCBhbnl0aGluZywgYnV0IGp1c3QgYmVjYXVzZQo+PiB3
ZSd2ZSBjaGF0dGVkIGFib3V0IHRoaXMgaXNzdWUgb24gSVJDIDotKSBdCj4+Cj4gRXhjZXB0LCBJ
IGRpZCBub3QgYWRkIGl0LiA6LVAKPiAKPiBBbnl3YXkuLi4KPiAKPj4gT24gVHVlLCAyMDE4LTA0
LTEwIGF0IDIyOjM3ICswMjAwLCBPbGFmIEhlcmluZyB3cm90ZToKPj4+IE9uIFR1ZSwgQXByIDEw
LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4+Cj4+PiAgICAgQlVHX09OKF9fdmNwdV9vbl9ydW5x
KENTQ0hFRF9WQ1BVKHZjKSkpOwo+Pj4KPiAuLi4gcGF0Y2ggYXR0YWNoZWQuCgpXb3VsZG4ndCBp
dCBtYWtlIG1vcmUgc2Vuc2UgdG8gYWRkIHRoZSBjYWxsIG9mIHZjcHVfc2xlZXBfbm9zeW5jKCkK
dG8gdmNwdV9taWdyYXRlKCkgYW5kIGRyb3AgYWxsIHRoZSBvdGhlciBjYWxscyBvZiB2Y3B1X3Ns
ZWVwX25vc3luYygpCmJlZm9yZSBjYWxsaW5nIHZjcHVfbWlncmF0ZSgpPwoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
