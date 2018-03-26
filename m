From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 13/20] xen/evtchn: Pass max_evtchn_port into
 evtchn_init()
Date: Mon, 26 Mar 2018 08:01:21 -0600
Message-ID: <5AB9195102000078001B6236@prv1-mh.provo.novell.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-14-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-14-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: JulienGrall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE4IGF0IDIwOjEzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0
dXAuYwo+IEBAIC02OTMsNyArNjkzLDkgQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVk
IGxvbmcgYm9vdF9waHlzX29mZnNldCwKPiAgICAgIGNvbnN0IGNoYXIgKmNtZGxpbmU7Cj4gICAg
ICBzdHJ1Y3QgYm9vdG1vZHVsZSAqeGVuX2Jvb3Rtb2R1bGU7Cj4gICAgICBzdHJ1Y3QgZG9tYWlu
ICpkb20wOwo+IC0gICAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIGRvbTBfY2ZnID0g
e307Cj4gKyAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gZG9tMF9jZmcgPSB7Cj4g
KyAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0xLAo+ICsgICAgfTsKPiAgCj4gICAgICBkY2Fj
aGVfbGluZV9ieXRlcyA9IHJlYWRfZGNhY2hlX2xpbmVfYnl0ZXMoKTsKPiAgCj4gLS0tIGEveGVu
L2FyY2gveDg2L3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+IEBAIC02NzMs
NiArNjczLDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9u
ZyBtYmlfcCkKPiAgICAgIH07Cj4gICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4g
ZG9tMF9jZmcgPSB7Cj4gICAgICAgICAgLmZsYWdzID0gWEVOX0RPTUNUTF9DREZfczNfaW50ZWdy
aXR5LAo+ICsgICAgICAgIC5tYXhfZXZ0Y2huX3BvcnQgPSAtMSwKPiAgICAgIH07CgpBbnkgY2hh
bmNlIEkgY2FuIHRhbGsgeW91IGludG8gdXNpbmcgSU5UX01BWCwgVUlOVF9NQVgsIG9yIH4wdQpp
biBib3RoIGNhc2VzIGFib3ZlLCBzZWVpbmcgdGhhdCBtYXhfZXZ0Y2huX3BvcnQncyB0eXBlIGlz
CnVuc2lnbmVkIGludD8gT3RoZXIgdGhhbiB0aGlzClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
