From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH v2] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Tue, 26 Feb 2019 15:01:01 +0000
Message-ID: <43e9e6a4-f926-90b9-f941-b0c4a95667ba@citrix.com>
References: <1551186774-30858-1-git-send-email-igor.druzhinin@citrix.com>
 <e8a57eca-a440-88b6-fa8e-13be283119ee@citrix.com>
 <5C75539D020000780021A5A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AghO=RB=citrix.com=prvs=9532012e5=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gyeEP-0007oC-En
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 15:01:17 +0000
In-Reply-To: <5C75539D020000780021A5A2@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDIvMjAxOSAxNDo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjYuMDIuMTkg
YXQgMTQ6MzMsIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjYvMDIv
MjAxOSAxMzoxMiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBAQCAtMjkyLDYgKzI5NSw3IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCB3cml0ZV93YXRjaGRvZ19jb3VudGVyKGNvbnN0IGNoYXIgKmRl
c2NyKQo+Pj4gICAgICB1NjQgY291bnQgPSAodTY0KWNwdV9raHogKiAxMDAwOwo+Pj4gIAo+Pj4g
ICAgICBkb19kaXYoY291bnQsIG5taV9oeik7Cj4+PiArICAgIGNvdW50ID0gbWluKGNvdW50LCAo
MVVMIDw8IChubWlfcDZfZXZlbnRfd2lkdGggLSAxKSkgLSAxKTsKPj4+ICAgICAgaWYoZGVzY3Ip
Cj4+PiAgICAgICAgICBEcHJpbnRrKCJzZXR0aW5nICVzIHRvIC0lIyJQUkl4NjQiXG4iLCBkZXNj
ciwgY291bnQpOwo+Pj4gICAgICB3cm1zcmwobm1pX3BlcmZjdHJfbXNyLCAwIC0gY291bnQpOwo+
Pgo+PiBJIG1pc3Rha2VubHkgdXNlZCBubWlfcDZfZXZlbnRfd2lkdGggaW4gYSBzaGFyZWQgY2Fs
bCBmb3IgYWxsCj4+IGFyY2hpdGVjdHVyZXMgLSBJJ2xsIGZpeCBpdCBpbiB2My4KPiAKPiBCdXQg
aXMgY2xpcHBpbmcgdGhlIGNvdW50IHZhbGlkIGF0IGFsbCwgbm8gbWF0dGVyIHdoZXJlIHlvdSBk
byBpdD8KPiBXb24ndCB0aGUgTk1JIGdldCByYWlzZWQgZWFybGllciB0aGFuIGV4cGVjdGVkIHRo
ZW4/IFdvdWxkbid0Cj4gaXQgcmF0aGVyIGJlIG5taV9oeiB0aGF0IHdvdWxkIHRoZW4gbmVlZCBj
aGFuZ2luZyBpZiBjb3VudAo+IGVuZHMgdXAgdG8gbGFyZ2U/Cj4gCgpGcm9tIG15IHVuZGVyc3Rh
bmRpbmcsIHRoZSBsb2dpYyBpcyB0aGF0IHdlJ3JlIHRyeWluZyBvdXIgYmVzdCB0byBtYWtlCnRo
ZSBkZWxheSBiZXR3ZWVuIHRpY2tzIGFzIGxvbmcgYXMgcG9zc2libGUgYnV0IG5vdCBsb25nZXIg
dGhhbiAwLjUgc2VjLgpUaGlzLCBvZiBjb3Vyc2UsIHdvcmtzIG9ubHkgaWYgdGhlIGludmFyaWFu
dCBvZiB0aGUgaGlnaGVzdCBiaXQgYmVpbmcgMQppcyBwcmVzZXJ2ZWQuCgpBbHRob3VnaCwgSSB3
b3VsZG4ndCBtaW5kIHRvIGRyb3AgdGhpcyBwYXJ0IHNpbmNlIGl0IGJhc2ljYWxseSB3b3JrZWQK
YmVmb3JlIGV2ZW4gd2l0aG91dCBjbGlwcGluZy4KCklnb3IKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
