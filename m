From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 24/50] x86emul: support AVX512{F,
 DQ} FP-to-uint conversion insns
Date: Tue, 21 May 2019 13:09:00 +0100
Message-ID: <cbe95b58-7585-4d64-6070-f99a55d9b16c@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B844B020000780021F211@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6u0k=TV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hT3Zr-0005j5-GY
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 12:09:07 +0000
In-Reply-To: <5C8B844B020000780021F211@prv1-mh.provo.novell.com>
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

T24gMTUvMDMvMjAxOSAxMDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQWxvbmcgdGhlIGxpbmVz
IG9mIHByaW9yIHBhdGNoZXMsIFZDVlR7LFR9UFMyVVFRIGFzIHdlbGwgYXMKPiBWQ1ZUeyxUfVN7
UyxEfTJVU0kgbmVlZCAibWFudWFsIiBvdmVycmlkZXMgb2YgZGlzcDhzY2FsZS4KPgo+IFRoZSB0
d29ieXRlX3RhYmxlW10gZW50cmllcyBnZXQgYWx0ZXJlZCwgd2l0aCB0aGVpciBwcmlvciB2YWx1
ZXMKPiBub3cgcHV0IGluIHBsYWNlIGluIHg4Nl9kZWNvZGVfdHdvYnl0ZSgpLgo+Cj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
