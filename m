From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 13/17] x86: don't create Dom0 if neither PV
 nor HVM is available
Date: Fri, 12 Oct 2018 16:28:21 +0100
Message-ID: <d6dd5b87-b104-ec2e-d48a-533e94adfe64@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <9f342296979cad0b5dea238c30a082428f25254f.1538667753.git-series.wei.liu2@citrix.com>
 <5BC0B9EB02000078001F1145@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zou9=my=citrix.com=prvs=816151957=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gAzMX-0003nN-1F
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:28:25 +0000
In-Reply-To: <5BC0B9EB02000078001F1145@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggMTY6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA0LjEwLjE4IGF0
IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFRoaXMgd2lsbCBnaXZlIHVz
IGEgWGVuIHNldHRpbmcgaW4gaWRsZSBsb29wLiBUaGlzIGRvZXNuJ3QgaGF2ZQo+PiBwcmFjdGlj
YWwgdXNlIGV4Y2VwdCBmb3IgZGVidWdnaW5nIHB1cnBvc2UuCj4gSG1tLCB0aGF0J3MgYW4gYWNj
ZXB0YWJsZSBhbHRlcm5hdGl2ZSB0byB0aGUgcGFuaWMoKSB2YXJpYW50LCBidXQKPiBJJ2Qgc3Rp
bGwgcHJlZmVyIHRoYXQgb25lLiBBZ2FpbiAtIGxldCdzIHNlZSBpZiBBbmRyZXcgaGFzIGFuIG9w
aW5pb24KPiBlaXRoZXIgd2F5LgoKSSB0aGluayB0aGF0LCBmb3IgdGhlIHB1cnBvc2Ugb2Yga2Vl
cGluZyBvdXIgaW50ZXJmYWNlcyBjbGVhbiwgYmVpbmcKYWJsZSB0byBjb21waWxlIHdpdGhvdXQg
UFYgYW5kIHdpdGhvdXQgSFZNIGlzIGEgdXNlZnVsIHByb3BlcnR5Cihlc3BlY2lhbGx5IGFzIHJh
bmRjb25maWcgc2hvdWxkIGhpdCBpdCBvbmUgaW4gZXZlcnkgNCBjYXNlcykuCgpJJ3ZlIHNwZWNp
ZmljYWxseSBuZWVkZWQgdG8gaGF2ZSBubyBkb20wIGZvciBjZXJ0YWluIGRlYnVnZ2luZyBpbiB0
aGUKcGFzdC7CoCAoVGhlIEhQRVQgc2VyaWVzIHRvIGZpeCB0aGUgYnJva2VuIE1TSSBoYW5kbGVy
LCB3aGljaCBJIHJlYWxpc2UKc3RpbGwgaGFzbid0IG1hZGUgaXRzIHdheSB1cHN0cmVhbSB5ZXQu
KQoKSSdtIGxlc3MgY2VydGFpbiBob3dldmVyIGlmIGltcGxlbWVudGluZyBpdCBsaWtlIHRoaXMg
aXMgd2lzZS7CoCBJCmltcGxlbWVudGVkIGl0IHdpdGggYSAibm9kb20wIiBjb21tYW5kIGxpbmUg
cGFyYW1ldGVyLCBhbmQgbGVmdCB0aGUgcmVzdApvZiB0aGUgZnVuY3Rpb25hbGl0eSBpbnRhY3Qu
CgpJbiBwYXJ0aWN1bGFyLCBvbmUgZnV6emluZyBpZGVhIEkgaGF2ZSBpcyB0byBoYXZlIGEgdGlu
eSBBRkwgc3R1YiBvbiB0aGUKZW5kIG9mIHRoZSBzZXJpYWwgcG9ydCwgYXQgd2hpY2ggcG9pbnQs
IGhhdmluZyBubyBkb20wIGJ1dCBQViBhbmQgSFZNCmZ1bGx5IGNvbXBpbGVkIGluIHdvdWxkIGJl
IHRoZSBpZGVhbCBwb3NpdGlvbi4KCkknbSBzb3JyeSBpZiB0aGlzIGlzbid0IG5lY2Vzc2FyaWx5
IGEgdmVyeSBoZWxwZnVsIGFuc3dlci7CoCBJJ2QgYmUKdGVtcHRlZCB0byBkcm9wIHRoaXMgcGF0
Y2ggZm9yIG5vdywgYW5kIGxldCB0aGUgZmlyc3QgcGVyc29uIHdpdGggYQpjb25jcmV0ZSB1c2Vj
YXNlIHRvIGRlY2lkZSBleGFjdGx5IGhvdyBhIG5vLWRvbTAgc3lzdGVtIHdvdWxkIGxvb2suCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
