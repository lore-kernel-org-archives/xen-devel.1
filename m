From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 11/44] x86emul: support AVX512F "normal"
 FP compare insns
Date: Tue, 13 Nov 2018 19:04:13 +0000
Message-ID: <b2122d5c-802b-fb36-7578-97aff666d2c4@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BAA34B502000078001EB9B6@prv1-mh.provo.novell.com>
 <5BAA38EE02000078001EBA42@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fay+=ny=citrix.com=prvs=848d83c09=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gMe0b-0004LW-UZ
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 19:05:57 +0000
In-Reply-To: <5BAA38EE02000078001EBA42@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hhdCBkbyB5b3UgY29uc2lkZXIgIm5vcm1hbCIgaGVyZT8KCk9uIDI1LzA5LzIwMTggMTQ6MzIs
IEphbiBCZXVsaWNoIHdyb3RlOgo+IEFsc28gY29ycmVjdCB0aGUgQVZYIGNvdW50ZXJwYXJ0J3Mg
Y29tbWVudC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KClRoZSBjb250ZW50IGl0c2VsZiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4sCmJ1dCBwcmVmZXJhYmx5IHdpdGggYSBiZXR0ZXIgZGVzY3JpcHRp
b24uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
