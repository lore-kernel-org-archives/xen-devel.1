From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86emul: slightly alter AVX512
 exception checking conditionals
Date: Mon, 10 Dec 2018 14:00:19 +0000
Message-ID: <b74c858b-f758-5621-2d56-9f63d0f05fed@citrix.com>
References: <5C0A55780200007800204012@prv1-mh.provo.novell.com>
 <5C0A5701020000780020401F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R27G=OT=citrix.com=prvs=87506bf53=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gWM6n-0005ka-Lk
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 14:00:29 +0000
In-Reply-To: <5C0A5701020000780020401F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMjAxOCAxMToxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgYWN0dWFsbHkg
YmVuaWduIChvcGVyYW5kcyBhcmUgZWl0aGVyIHJlZ2lzdGVyIG9yIG1lbW9yeSBvbmVzCj4gYW55
d2F5KSwgSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gdXNlICE9IGluc3RlYWQgb2YgPT0gZm9yIHN1
Y2ggY2hlY2tzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKSSBkb24ndCBzZWUgdGhlIHBvaW50IG9mIG1ha2luZyB0aGlzIGNoYW5nZS7CoCBDb2Rl
IGlzIGVhc2llciB0byBmb2xsb3cKd2hlbiB0aGVyZSBhcmUgZmV3ZXIgbmVnYXRpb25zLgoKQnV0
IHdoYXRldmVyIC0gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
