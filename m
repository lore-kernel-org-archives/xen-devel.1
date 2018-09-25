From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] arm: fix Dom build after cd8015b634
Date: Tue, 25 Sep 2018 14:02:05 +0100
Message-ID: <0fa633f7-3421-0faa-5c81-152523a3f169@citrix.com>
References: <5BAA309A02000078001EB990@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gmpq=mh=citrix.com=prvs=79922396b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g4n0j-0002b1-Iw
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 13:04:17 +0000
In-Reply-To: <5BAA309A02000078001EB990@prv1-mh.provo.novell.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDkvMTggMTM6NTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSByZW1vdmFsIG9mIHRo
ZSBWTEEgdGhlcmUgaGFzIGNoYW5nZWQgc2l6ZW9mKCkgZm9yIHRoZSBhcnJheS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBVbnRlc3Rl
ZDsgcHVyZWx5IGJhc2VkIG9uIGxvb2tpbmcgYXQgdGhlIGNvZGUuCgpPb3BzLsKgIFllcyAtIHRo
YXQgd2lsbCBjYXVzZSB0aGluZ3MgdG8gZ28gd3JvbmcuCgpSZXZpZXdlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
