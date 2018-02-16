From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools: libxenstat: fix format string
	overflow
Date: Fri, 16 Feb 2018 17:58:36 +0000
Message-ID: <20180216175836.xozwaxfhv3uzv22w@citrix.com>
References: <151880261167.5804.2843218804728106933.stgit@Solace.fritz.box>
 <20180216174405.z2dut66rkh3x5pnw@citrix.com>
 <1518803708.3813.18.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ljqo=fk=citrix.com=prvs=578ce87c4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1emkHU-0008AE-9O
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 17:58:44 +0000
Content-Disposition: inline
In-Reply-To: <1518803708.3813.18.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMDY6NTU6MDhQTSArMDEwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gT24gRnJpLCAyMDE4LTAyLTE2IGF0IDE3OjQ0ICswMDAwLCBXZWkgTGl1IHdyb3Rl
Ogo+ID4gT24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMDY6MzY6NTFQTSArMDEwMCwgRGFyaW8gRmFn
Z2lvbGkgd3JvdGU6Cj4gPiA+IAo+ID4gPiAtLS0gYS90b29scy94ZW5zdGF0L2xpYnhlbnN0YXQv
c3JjL3hlbnN0YXRfbGludXguYwo+ID4gPiArKysgYi90b29scy94ZW5zdGF0L2xpYnhlbnN0YXQv
c3JjL3hlbnN0YXRfbGludXguYwo+ID4gPiBAQCAtNjksMTggKzY5LDIwIEBAIHZvaWQgZ2V0QnJp
ZGdlKGNoYXIgKmV4Y2x1ZGVOYW1lLCBjaGFyICpyZXN1bHQsCj4gPiA+IHNpemVfdCByZXN1bHRM
ZW4pCj4gPiA+ICAJc3RydWN0IGRpcmVudCAqZGU7Cj4gPiA+ICAJRElSICpkOwo+ID4gPiAgCj4g
PiA+IC0JY2hhciB0bXBbMjU2XSA9IHsgMCB9Owo+ID4gPiAtCj4gPiA+ICAJZCA9IG9wZW5kaXIo
Ii9zeXMvY2xhc3MvbmV0Iik7Cj4gPiA+ICAJd2hpbGUgKChkZSA9IHJlYWRkaXIoZCkpICE9IE5V
TEwpIHsKPiA+ID4gIAkJaWYgKChzdHJsZW4oZGUtPmRfbmFtZSkgPiAwKSAmJiAoZGUtPmRfbmFt
ZVswXSAhPQo+ID4gPiAnLicpCj4gPiA+ICAJCQkmJiAoc3Ryc3RyKGRlLT5kX25hbWUsIGV4Y2x1
ZGVOYW1lKSA9PQo+ID4gPiBOVUxMKSkgewo+ID4gPiAtCQkJCXNwcmludGYodG1wLAo+ID4gPiAi
L3N5cy9jbGFzcy9uZXQvJXMvYnJpZGdlIiwgZGUtPmRfbmFtZSk7Cj4gPiA+ICsJCQkJY2hhciAq
dG1wOwo+ID4gPiArCj4gPiA+ICsJCQkJYXNwcmludGYoJnRtcCwKPiA+ID4gIi9zeXMvY2xhc3Mv
bmV0LyVzL2JyaWRnZSIsIGRlLT5kX25hbWUpOwo+ID4gCj4gPiBOZWVkIHRvIGNoZWNrIHRoZSBy
ZXR1cm4gdmFsdWUgb2YgYXNwcmludGYuCj4gPiAKPiBSaWdodCEgQW5kIHdoYXQgZG8gSSBkbyBp
ZiBpdCBmYWlscywgJ2NvbnRpbnVlJyB0aGUgd2hpbGUoKSwgSSBndWVzcz8KPiAKCkxvb2tpbmcg
YXQgdGhlIGVycm9yIG1lc3NhZ2UgYWdhaW4sIGNhbiB5b3UganVzdCBpbmNyZWFzZSB0aGUgYnVm
ZmVyCnNpemUgdG8gNTEyPyBUaGF0IHNob3VsZCBkbyB0aGUgam9iPwoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
