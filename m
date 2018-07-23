From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH v2] xen/spinlock: Don't use pvqspinlock if
 only 1 vCPU
Date: Sun, 22 Jul 2018 21:42:57 -0700
Message-ID: <20180723044257.m7pjrnp7jjqggqij__42935.6762943373$1532320929$gmane$org@linux-r8p5>
References: <1532036397-19449-1-git-send-email-longman@redhat.com>
 <20180719215456.5ho3udhfoqlkh75a@linux-r8p5>
 <00e98205-606a-a121-36c2-dedaeae1d0bb@redhat.com>
 <CANRm+CyHfvBKVKNk+pKF+s6+1seZ8c+NyjHuepT2Mf+4Cdd-2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cmqz=kh=stgolabs.net=dave@srs-us1.protection.inumbo.net>)
 id 1fhSgd-0001Zj-Hf
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 04:43:07 +0000
Content-Disposition: inline
In-Reply-To: <CANRm+CyHfvBKVKNk+pKF+s6+1seZ8c+NyjHuepT2Mf+4Cdd-2w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wanpeng Li <kernellwp@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, the arch/x86 maintainers <x86@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Radim Krcmar <rkrcmar@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Waiman Long <longman@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMyBKdWwgMjAxOCwgV2FucGVuZyBMaSB3cm90ZToKCj5PbiBGcmksIDIwIEp1bCAy
MDE4IGF0IDA2OjAzLCBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPiB3cm90ZToKPj4K
Pj4gT24gMDcvMTkvMjAxOCAwNTo1NCBQTSwgRGF2aWRsb2hyIEJ1ZXNvIHdyb3RlOgo+PiA+IE9u
IFRodSwgMTkgSnVsIDIwMTgsIFdhaW1hbiBMb25nIHdyb3RlOgo+PiA+Cj4+ID4+IE9uIGEgVk0g
d2l0aCBvbmx5IDEgdkNQVSwgdGhlIGxvY2tpbmcgZmFzdCBwYXRocyB3aWxsIGFsd2F5cyBiZQo+
PiA+PiBzdWNjZXNzZnVsLiBJbiB0aGlzIGNhc2UsIHRoZXJlIGlzIG5vIG5lZWQgdG8gdXNlIHRo
ZSB0aGUgUFYgcXNwaW5sb2NrCj4+ID4+IGNvZGUgd2hpY2ggaGFzIGhpZ2hlciBvdmVyaGVhZCBv
biB0aGUgdW5sb2NrIHNpZGUgdGhhbiB0aGUgbmF0aXZlCj4+ID4+IHFzcGlubG9jayBjb2RlLgo+
PiA+Pgo+PiA+PiBUaGUgeGVuX3B2c3BpbiB2ZXJpYWJsZSBpcyBhbHNvIHR1cm5lZCBvZmYgaW4g
dGhpcyAxIHZDUFUgY2FzZSB0bwoKcy92ZXJpYWJsZQogIHZhcmlhYmxlCgo+PiA+PiBlbGltaW5h
dGUgdW5uZWVkZWQgcHZxc3BpbmxvY2sgaW5pdGlhbGl6YXRpb24gaW4geGVuX2luaXRfbG9ja19j
cHUoKQo+PiA+PiB3aGljaCBpcyBydW4gYWZ0ZXIgeGVuX2luaXRfc3BpbmxvY2tzKCkuCj4+ID4K
Pj4gPiBXb3VsZG4ndCBrdm0gYWxzbyB3YW50IHRoaXM/Cj4+ID4KPj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva2VybmVsL2t2bS5jIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCj4+ID4gaW5kZXgg
YTM3YmRhMzhkMjA1Li45NWFjZWI2OTIwMTAgMTAwNjQ0Cj4+ID4gLS0tIGEvYXJjaC94ODYva2Vy
bmVsL2t2bS5jCj4+ID4gKysrIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCj4+ID4gQEAgLTQ1Nyw3
ICs0NTcsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V2X21hcF9wZXJjcHVfZGF0YSh2b2lkKQo+
PiA+IHN0YXRpYyB2b2lkIF9faW5pdCBrdm1fc21wX3ByZXBhcmVfY3B1cyh1bnNpZ25lZCBpbnQg
bWF4X2NwdXMpCj4+ID4gewo+PiA+ICAgICBuYXRpdmVfc21wX3ByZXBhcmVfY3B1cyhtYXhfY3B1
cyk7Cj4+ID4gLSAgICBpZiAoa3ZtX3BhcmFfaGFzX2hpbnQoS1ZNX0hJTlRTX1JFQUxUSU1FKSkK
Pj4gPiArICAgIGlmIChudW1fcG9zc2libGVfY3B1cygpID09IDEgfHwKPj4gPiArICAgICAgICBr
dm1fcGFyYV9oYXNfaGludChLVk1fSElOVFNfUkVBTFRJTUUpKQo+PiA+ICAgICAgICAgc3RhdGlj
X2JyYW5jaF9kaXNhYmxlKCZ2aXJ0X3NwaW5fbG9ja19rZXkpOwo+PiA+IH0KPj4KPj4gVGhhdCBk
b2Vzbid0IHJlYWxseSBtYXR0ZXIgYXMgdGhlIHNsb3dwYXRoIHdpbGwgbmV2ZXIgZ2V0IGV4ZWN1
dGVkIGluCj4+IHRoZSAxIHZDUFUgY2FzZS4KCkhvdyBkb2VzIHRoaXMgZGlmZmVyIHRoZW4gZnJv
bSB4ZW4sIHRoZW4/IEkgbWVhbiwgc2FtZSBwcmluY2lwbGUgYXBwbGllcy4KCj4KPlNvIHRoaXMg
aXMgbm90IG5lZWRlZCBpbiBrdm0gdHJlZT8KPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS92aXJ0L2t2bS9rdm0uZ2l0L2NvbW1pdC8/aD1xdWV1ZSZpZD0zYTc5MjE5OTAwNGVjMzM1MzQ2
Y2M2MDdkNjI2MDBhMzk5YTdlZTAyCgpIbW0gSSB3b3VsZCB0aGluayB0aGF0IG15IHBhdGNoIHdv
dWxkIGJlIG1vcmUgYXBwcm9waWF0ZSBhcyBpdCBhY3R1YWxseSBkb2VzCndoYXQgdGhlIGNvbW1l
bnQgc2F5cy4KClRoYW5rcywKRGF2aWRsb2hyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
