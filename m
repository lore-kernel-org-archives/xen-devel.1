From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2] xen/spinlock: Don't use pvqspinlock if
 only 1 vCPU
Date: Mon, 23 Jul 2018 09:33:51 -0400
Message-ID: <29f7dd77-267a-0ba7-f4e8-6ef3b3de167c__15252.4526384243$1532352738$gmane$org@redhat.com>
References: <1532036397-19449-1-git-send-email-longman@redhat.com>
 <20180719215456.5ho3udhfoqlkh75a@linux-r8p5>
 <00e98205-606a-a121-36c2-dedaeae1d0bb@redhat.com>
 <CANRm+CyHfvBKVKNk+pKF+s6+1seZ8c+NyjHuepT2Mf+4Cdd-2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eoms=kh=redhat.com=longman@srs-us1.protection.inumbo.net>)
 id 1fhayI-0005eb-BA
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 13:33:54 +0000
In-Reply-To: <CANRm+CyHfvBKVKNk+pKF+s6+1seZ8c+NyjHuepT2Mf+4Cdd-2w@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wanpeng Li <kernellwp@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Radim Krcmar <rkrcmar@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Davidlohr Bueso <dave@stgolabs.net>, the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjIvMjAxOCAxMTozMSBQTSwgV2FucGVuZyBMaSB3cm90ZToKPiBPbiBGcmksIDIwIEp1
bCAyMDE4IGF0IDA2OjAzLCBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPiB3cm90ZToK
Pj4gT24gMDcvMTkvMjAxOCAwNTo1NCBQTSwgRGF2aWRsb2hyIEJ1ZXNvIHdyb3RlOgo+Pj4gT24g
VGh1LCAxOSBKdWwgMjAxOCwgV2FpbWFuIExvbmcgd3JvdGU6Cj4+Pgo+Pj4+IE9uIGEgVk0gd2l0
aCBvbmx5IDEgdkNQVSwgdGhlIGxvY2tpbmcgZmFzdCBwYXRocyB3aWxsIGFsd2F5cyBiZQo+Pj4+
IHN1Y2Nlc3NmdWwuIEluIHRoaXMgY2FzZSwgdGhlcmUgaXMgbm8gbmVlZCB0byB1c2UgdGhlIHRo
ZSBQViBxc3BpbmxvY2sKPj4+PiBjb2RlIHdoaWNoIGhhcyBoaWdoZXIgb3ZlcmhlYWQgb24gdGhl
IHVubG9jayBzaWRlIHRoYW4gdGhlIG5hdGl2ZQo+Pj4+IHFzcGlubG9jayBjb2RlLgo+Pj4+Cj4+
Pj4gVGhlIHhlbl9wdnNwaW4gdmVyaWFibGUgaXMgYWxzbyB0dXJuZWQgb2ZmIGluIHRoaXMgMSB2
Q1BVIGNhc2UgdG8KPj4+PiBlbGltaW5hdGUgdW5uZWVkZWQgcHZxc3BpbmxvY2sgaW5pdGlhbGl6
YXRpb24gaW4geGVuX2luaXRfbG9ja19jcHUoKQo+Pj4+IHdoaWNoIGlzIHJ1biBhZnRlciB4ZW5f
aW5pdF9zcGlubG9ja3MoKS4KPj4+IFdvdWxkbid0IGt2bSBhbHNvIHdhbnQgdGhpcz8KPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2t2bS5jIGIvYXJjaC94ODYva2VybmVsL2t2
bS5jCj4+PiBpbmRleCBhMzdiZGEzOGQyMDUuLjk1YWNlYjY5MjAxMCAxMDA2NDQKPj4+IC0tLSBh
L2FyY2gveDg2L2tlcm5lbC9rdm0uYwo+Pj4gKysrIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCj4+
PiBAQCAtNDU3LDcgKzQ1Nyw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXZfbWFwX3BlcmNwdV9k
YXRhKHZvaWQpCj4+PiBzdGF0aWMgdm9pZCBfX2luaXQga3ZtX3NtcF9wcmVwYXJlX2NwdXModW5z
aWduZWQgaW50IG1heF9jcHVzKQo+Pj4gewo+Pj4gICAgIG5hdGl2ZV9zbXBfcHJlcGFyZV9jcHVz
KG1heF9jcHVzKTsKPj4+IC0gICAgaWYgKGt2bV9wYXJhX2hhc19oaW50KEtWTV9ISU5UU19SRUFM
VElNRSkpCj4+PiArICAgIGlmIChudW1fcG9zc2libGVfY3B1cygpID09IDEgfHwKPj4+ICsgICAg
ICAgIGt2bV9wYXJhX2hhc19oaW50KEtWTV9ISU5UU19SRUFMVElNRSkpCj4+PiAgICAgICAgIHN0
YXRpY19icmFuY2hfZGlzYWJsZSgmdmlydF9zcGluX2xvY2tfa2V5KTsKPj4+IH0KPj4gVGhhdCBk
b2Vzbid0IHJlYWxseSBtYXR0ZXIgYXMgdGhlIHNsb3dwYXRoIHdpbGwgbmV2ZXIgZ2V0IGV4ZWN1
dGVkIGluCj4+IHRoZSAxIHZDUFUgY2FzZS4KPiBTbyB0aGlzIGlzIG5vdCBuZWVkZWQgaW4ga3Zt
IHRyZWU/Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3ZpcnQva3ZtL2t2bS5naXQv
Y29tbWl0Lz9oPXF1ZXVlJmlkPTNhNzkyMTk5MDA0ZWMzMzUzNDZjYzYwN2Q2MjYwMGEzOTlhN2Vl
MDIKPgo+IFJlZ2FyZHMsCj4gV2FucGVuZyBMaQoKV2l0aCBvbmx5IDEgdkNQVSwgdGhlIHNsb3dw
YXRoIHdpbGwgbm90IGJlIGV4ZWN1dGVkLiBJdCB3aWxsIGJlIGEKZGVhZGxvY2sgaWYgaXQgaGFw
cGVucy4gU28gd2UgZG9uJ3QgbmVlZCB0byBleHBsaWNpdGx5IGRpc2FibGUgdGhlCnN0YXRpYyBr
ZXkgaGVyZS4KCi1Mb25nbWFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
