From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4] x86/HVM: don't #GP/#SS on wrapping
 virt->linear translations
Date: Tue, 11 Sep 2018 11:02:09 +0100
Message-ID: <74179665-f365-09c6-2f43-5d64bbe5338e@citrix.com>
References: <5B96791902000078001E6CD9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l7he=lz=citrix.com=prvs=785855fd2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fzfUr-0002Rw-8n
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 10:02:13 +0000
In-Reply-To: <5B96791902000078001E6CD9@prv1-mh.provo.novell.com>
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

T24gMTAvMDkvMTggMTU6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFJlYWwgaGFyZHdhcmUgd3Jh
cHMgc2lsZW50bHkgaW4gbW9zdCBjYXNlcywgc28gd2Ugc2hvdWxkIGJlaGF2ZSB0aGUKPiBzYW1l
LiBBbHNvIHNwbGl0IHJlYWwgYW5kIFZNODYgbW9kZSBoYW5kbGluZywgYXMgdGhlIGxhdHRlciBy
ZWFsbHkKPiBvdWdodCB0byBoYXZlIGxpbWl0IGNoZWNrcyBhcHBsaWVkLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
