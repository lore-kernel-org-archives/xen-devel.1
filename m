From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 19/25] x86emul: tell cmpxchg hook whether
 LOCK is in effect
Date: Fri, 2 Feb 2018 14:13:46 +0000
Message-ID: <55838748-9d9a-1478-fc8a-445cda40096c@citrix.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A295ACD0200007800195985@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=g0dj=e4=citrix.com=prvs=564f8cbd0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ehc6D-0007gQ-T2
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 14:13:53 +0000
In-Reply-To: <5A295ACD0200007800195985@prv-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTcgMTQ6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgaXMgbmVjZXNzYXJ5
IGZvciB0aGUgaG9vayB0byBjb3JyZWN0bHkgcGVyZm9ybSB0aGUgb3BlcmF0aW9uLgo+Cj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
