From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: remove dead code from
 cpuid4_cache_lookup()
Date: Fri, 29 Jun 2018 14:28:44 +0100
Message-ID: <67f28e47-cea9-d8a8-3a08-42a4bac150f5@citrix.com>
References: <5B3630B502000078001CF279@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vmj+=jp=citrix.com=prvs=71170ba8f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fYtSe-0002qt-Kz
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 13:29:16 +0000
In-Reply-To: <5B3630B502000078001CF279@prv1-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDYvMTggMTQ6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC4uLiBhbmQgbWFrZSBudW1f
Y2FjaGVfbGVhdmVzIGxvY2FsIHRvIHRoZSBvbmx5IGZ1bmN0aW9uIHVzaW5nIGl0Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
