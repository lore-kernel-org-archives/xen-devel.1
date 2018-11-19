From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 14/47] x86emul: support AVX512{F,
 BW} packed integer compare insns
Date: Mon, 19 Nov 2018 19:09:51 +0000
Message-ID: <85635ff5-8c09-f8b3-7934-841f7f93630a@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BF289D802000078001FD3DF@prv1-mh.provo.novell.com>
 <5BF28E9102000078001FD4B1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gnyi=N6=citrix.com=prvs=8544ffb4f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gOovj-0004F2-QJ
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 19:09:55 +0000
In-Reply-To: <5BF28E9102000078001FD4B1@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMjAxOCAxMDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW5jbHVkZSBWUFRFU1R7
LE59TXtCLEQsUSxXfSBhcyBvbmNlIGFnYWluIHBvc3NpYmx5IHVzZWQgYnkgdGhlIGNvbXBpbGVy
Cj4gZm9yIGNvbXBhcmlzb24gYWdhaW5zdCBhbGwtemVybyB2ZWN0b3JzLgo+Cj4gQWxzbyB0YWJs
ZSBlbnRyaWVzIGZvciBhIGZldyBtb3JlIGluc25zIGdldCB0aGVpciAuZDhzIGZpZWxkIHNldCBy
aWdodAo+IGF3YXksIGFnYWluIGluIG9yZGVyIHRvIG5vdCBzcGxpdCBhbmQgbGF0ZXIgcmUtY29t
YmluZSB0aGUgZ3JvdXBzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
