From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] trace: fix build with gcc9
Date: Thu, 7 Mar 2019 12:02:02 +0000
Message-ID: <6c98dadd-748f-0d84-6937-62b6e126678f@citrix.com>
References: <5C80F39B020000780021C629@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZAh+=RK=citrix.com=prvs=9627641c1=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1h1riw-0000Es-PF
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 12:02:06 +0000
In-Reply-To: <5C80F39B020000780021C629@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy83LzE5IDEwOjM0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBXaGlsZSBJJ3ZlIG5vdCBv
YnNlcnZlZCB0aGlzIG15c2VsZiwgZ2NjIDkgKGltbyB2YWxpZGx5KSByZXBvcnRlZGx5IG1heQo+
IGNvbXBsYWluCj4gCj4gdHJhY2UuYzogSW4gZnVuY3Rpb24gJ19fdHJhY2VfaHlwZXJjYWxsJzoK
PiB0cmFjZS5jOjgyNjoxOTogZXJyb3I6IHRha2luZyBhZGRyZXNzIG9mIHBhY2tlZCBtZW1iZXIg
b2YgJ3N0cnVjdCA8YW5vbnltb3VzPicgbWF5IHJlc3VsdCBpbiBhbiB1bmFsaWduZWQgcG9pbnRl
ciB2YWx1ZQo+IFstV2Vycm9yPWFkZHJlc3Mtb2YtcGFja2VkLW1lbWJlcl0KPiAgIDgyNiB8ICAg
ICB1aW50MzJfdCAqYSA9IGQuYXJnczsKCldhaXQsIGlzIHRoaXMgc2F5aW5nIHRoYXQgaW4gdGhp
cyBjYXNlIChpLmUuLCB3aXRoIGEgc2luZ2xlIHVpbnQzMl90CmJlZm9yZSBhcmdzKSwgeW91ICpk
byogZ2V0IGFuIHVuYWxpZ25lZCBwb2ludGVyIHZhbHVlLCBvciBqdXN0IHRoYXQgaWYKdGhlIHN0
cnVjdCBjaGFuZ2VzIGluIHRoZSBmdXR1cmUgdGhhdCB0aGUgcG9pbnRlciB2YWx1ZSBtYXkgYmVj
b21lCnVuLWFsaWduZWQ/CgpJZiB0aGUgbGF0dGVyLCBJIGRpc2FncmVlIHRoYXQgdGhlIHdhcm5p
bmcgaXMgdmFsaWQuICBJZiBhdCBzb21lIHBvaW50CmluIHRoZSBmdXR1cmUsICdvcCcgY2hhbmdl
cyB0byBiZSAoc2F5KSAxNiBiaXRzLCB0aGVuICp0aGF0KiBpcyB3aGVuIHRoZQpjb21waWxlciBz
aG91bGQgY29tcGxhaW47IGFuZCB0aGF0J3Mgd2hlbiB3ZSBjYW4gZWl0aGVyIGFkZCBpbiBvdXIg
b3duCnBhZGRpbmcsIG9yIGNoYW5nZSB0aGUgYWxnb3JpdGhtIG5vdCB0byByZXF1aXJlIGEgcG9p
bnRlciB0byBhcmdzW10uCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
