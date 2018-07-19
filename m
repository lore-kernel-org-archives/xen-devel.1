From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2] xen/spinlock: Don't use pvqspinlock if
 only 1 vCPU
Date: Thu, 19 Jul 2018 18:02:22 -0400
Message-ID: <00e98205-606a-a121-36c2-dedaeae1d0bb__31433.4898292602$1532037671$gmane$org@redhat.com>
References: <1532036397-19449-1-git-send-email-longman@redhat.com>
 <20180719215456.5ho3udhfoqlkh75a@linux-r8p5>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fsdu=kd=redhat.com=longman@srs-us1.protection.inumbo.net>)
 id 1fgH0C-000241-EB
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 22:02:24 +0000
In-Reply-To: <20180719215456.5ho3udhfoqlkh75a@linux-r8p5>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTkvMjAxOCAwNTo1NCBQTSwgRGF2aWRsb2hyIEJ1ZXNvIHdyb3RlOgo+IE9uIFRodSwg
MTkgSnVsIDIwMTgsIFdhaW1hbiBMb25nIHdyb3RlOgo+Cj4+IE9uIGEgVk0gd2l0aCBvbmx5IDEg
dkNQVSwgdGhlIGxvY2tpbmcgZmFzdCBwYXRocyB3aWxsIGFsd2F5cyBiZQo+PiBzdWNjZXNzZnVs
LiBJbiB0aGlzIGNhc2UsIHRoZXJlIGlzIG5vIG5lZWQgdG8gdXNlIHRoZSB0aGUgUFYgcXNwaW5s
b2NrCj4+IGNvZGUgd2hpY2ggaGFzIGhpZ2hlciBvdmVyaGVhZCBvbiB0aGUgdW5sb2NrIHNpZGUg
dGhhbiB0aGUgbmF0aXZlCj4+IHFzcGlubG9jayBjb2RlLgo+Pgo+PiBUaGUgeGVuX3B2c3BpbiB2
ZXJpYWJsZSBpcyBhbHNvIHR1cm5lZCBvZmYgaW4gdGhpcyAxIHZDUFUgY2FzZSB0bwo+PiBlbGlt
aW5hdGUgdW5uZWVkZWQgcHZxc3BpbmxvY2sgaW5pdGlhbGl6YXRpb24gaW4geGVuX2luaXRfbG9j
a19jcHUoKQo+PiB3aGljaCBpcyBydW4gYWZ0ZXIgeGVuX2luaXRfc3BpbmxvY2tzKCkuCj4KPiBX
b3VsZG4ndCBrdm0gYWxzbyB3YW50IHRoaXM/Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2Vy
bmVsL2t2bS5jIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCj4gaW5kZXggYTM3YmRhMzhkMjA1Li45
NWFjZWI2OTIwMTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva2VybmVsL2t2bS5jCj4gKysrIGIv
YXJjaC94ODYva2VybmVsL2t2bS5jCj4gQEAgLTQ1Nyw3ICs0NTcsOCBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgc2V2X21hcF9wZXJjcHVfZGF0YSh2b2lkKQo+IHN0YXRpYyB2b2lkIF9faW5pdCBrdm1f
c21wX3ByZXBhcmVfY3B1cyh1bnNpZ25lZCBpbnQgbWF4X2NwdXMpCj4gewo+ICAgICBuYXRpdmVf
c21wX3ByZXBhcmVfY3B1cyhtYXhfY3B1cyk7Cj4gLSAgICBpZiAoa3ZtX3BhcmFfaGFzX2hpbnQo
S1ZNX0hJTlRTX1JFQUxUSU1FKSkKPiArICAgIGlmIChudW1fcG9zc2libGVfY3B1cygpID09IDEg
fHwKPiArICAgICAgICBrdm1fcGFyYV9oYXNfaGludChLVk1fSElOVFNfUkVBTFRJTUUpKQo+ICAg
ICAgICAgc3RhdGljX2JyYW5jaF9kaXNhYmxlKCZ2aXJ0X3NwaW5fbG9ja19rZXkpOwo+IH0KClRo
YXQgZG9lc24ndCByZWFsbHkgbWF0dGVyIGFzIHRoZSBzbG93cGF0aCB3aWxsIG5ldmVyIGdldCBl
eGVjdXRlZCBpbgp0aGUgMSB2Q1BVIGNhc2UuCgotTG9uZ21hbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
