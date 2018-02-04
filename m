From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] pvcalls-back: do not return error on
	inet_accept EAGAIN
Date: Sun, 4 Feb 2018 14:20:25 -0500
Message-ID: <936e4d18-3f0d-3fc5-2272-c1ad9a5c7022__28836.2135798254$1517772000$gmane$org@oracle.com>
References: <alpine.DEB.2.10.1802021728420.10160@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=brpw=e6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eiPq9-0007Mg-Kh
 for xen-devel@lists.xenproject.org; Sun, 04 Feb 2018 19:20:37 +0000
In-Reply-To: <alpine.DEB.2.10.1802021728420.10160@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8wMi8yMDE4IDA4OjM0IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gV2hl
biB0aGUgY2xpZW50IHNlbmRzIGEgcmVndWxhciBibG9ja2luZyBhY2NlcHQgcmVxdWVzdCwgdGhl
IGJhY2tlbmQgaXMKPiBleHBlY3RlZCB0byByZXR1cm4gb25seSB3aGVuIHRoZSBhY2NlcHQgaXMg
Y29tcGxldGVkLCBzaW11bGF0aW5nIGEKPiBibG9ja2luZyBiZWhhdmlvciwgb3IgcmV0dXJuIGFu
IGVycm9yLgo+Cj4gU3BlY2lmaWNhbGx5LCBvbiBFQUdBSU4gZnJvbSBpbmV0X2FjY2VwdCwgdGhl
IGJhY2tlbmQgc2hvdWxkbid0IHJldHVybgo+ICJFQUdBSU4iIHRvIHRoZSBjbGllbnQuIEluc3Rl
YWQsIGl0IHNob3VsZCBzaW1wbHkgY29udGludWUgdGhlIHdhaXQuCj4gT3RoZXJ3aXNlLCB0aGUg
Y2xpZW50IHdpbGwgc2VuZCBhbm90aGVyIGFjY2VwdCByZXF1ZXN0LCB3aGljaCB3aWxsIGNhdXNl
Cj4gYW5vdGhlciBFQUdBSU4gdG8gYmUgc2VudCBiYWNrLCB3aGljaCBpcyBhIHdhc3RlIG9mIHJl
c291cmNlcyBhbmQgbm90Cj4gY29uZm9ybWluZyB0byB0aGUgZXhwZWN0ZWQgYmVoYXZpb3IuIENo
YW5nZSB0aGUgYmVoYXZpb3IgYnkgdHVybmluZyB0aGUKPiAiZ290byBlcnJvciIgaW50byBhIHJl
dHVybi4KPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub0BhcG9y
ZXRvLmNvbT4KCgpJIGFtIGxvb2tpbmcgYXQgU1lTQ0FMTF9ERUZJTkU0KGFjY2VwdDQpIGFuZCBz
b2NrLT5vcHMtPmFjY2VwdCAod2hpY2ggKkkgCnRoaW5rKiBpcyBpbmV0X2FjY2VwdCwgYXQgbGVh
c3QgaW4gc29tZSBjYXNlcykgcGFzc2VzIGFsbCBlcnJvcnMgCihpbmNsdWRpbmcgRUFHQUlOKcKg
IGJhY2sgdG8gdGhlIGNhbGxlci4gSXMgdGhpcyBhIGRpZmZlcmVudCBjYXNlPwoKLWJvcmlzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
