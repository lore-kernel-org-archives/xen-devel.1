From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen-blkfront: fix kernel panic with
 negotiate_mq error path
Date: Tue, 30 Oct 2018 17:52:39 +0100
Message-ID: <2d099bff-648f-e9bf-f2b6-127eb97852fb__3161.89797963506$1540918282$gmane$org@suse.com>
References: <1540918161-31283-1-git-send-email-manjunath.b.patil@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/7+2=nk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gHXFz-0008Jk-9p
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:52:43 +0000
In-Reply-To: <1540918161-31283-1-git-send-email-manjunath.b.patil@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manjunath Patil <manjunath.b.patil@oracle.com>, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, roger.pau@citrix.com
Cc: axboe@kernel.dk, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMTAvMjAxOCAxNzo0OSwgTWFuanVuYXRoIFBhdGlsIHdyb3RlOgo+IGluZm8tPm5yX3Jp
bmdzIGlzbid0IGFkanVzdGVkIGluIGNhc2Ugb2YgRU5PTUVNIGVycm9yIGZyb20KPiBuZWdvdGlh
dGVfbXEoKS4gVGhpcyBsZWFkcyB0byBrZXJuZWwgcGFuaWMgaW4gZXJyb3IgcGF0aC4KPiAKPiBU
eXBpY2FsIGNhbGwgc3RhY2sgaW52b2x2aW5nIHBhbmljIC0KPiAgIzggcGFnZV9mYXVsdCBhdCBm
ZmZmZmZmZjgxNzU5MzZmCj4gICAgIFtleGNlcHRpb24gUklQOiBibGtpZl9mcmVlX3JpbmcrMzNd
Cj4gICAgIFJJUDogZmZmZmZmZmZhMDE0OTQ5MSAgUlNQOiBmZmZmODgwNGY3NjczYzA4ICBSRkxB
R1M6IDAwMDEwMjkyCj4gIC4uLgo+ICAjOSBibGtpZl9mcmVlIGF0IGZmZmZmZmZmYTAxNDlhYWEg
W3hlbl9ibGtmcm9udF0KPiAgIzEwIHRhbGtfdG9fYmxrYmFjayBhdCBmZmZmZmZmZmEwMTRjOGNk
IFt4ZW5fYmxrZnJvbnRdCj4gICMxMSBibGtiYWNrX2NoYW5nZWQgYXQgZmZmZmZmZmZhMDE0ZWE4
YiBbeGVuX2Jsa2Zyb250XQo+ICAjMTIgeGVuYnVzX290aGVyZW5kX2NoYW5nZWQgYXQgZmZmZmZm
ZmY4MTQyNDY3MAo+ICAjMTMgYmFja2VuZF9jaGFuZ2VkIGF0IGZmZmZmZmZmODE0MjZkYzMKPiAg
IzE0IHhlbndhdGNoX3RocmVhZCBhdCBmZmZmZmZmZjgxNDIyZjI5Cj4gICMxNSBrdGhyZWFkIGF0
IGZmZmZmZmZmODEwYWJlNmEKPiAgIzE2IHJldF9mcm9tX2ZvcmsgYXQgZmZmZmZmZmY4MTc1NDA3
OAo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IDdlZDhjZTFjNWZjNyAo
Inhlbi1ibGtmcm9udDogbW92ZSBuZWdvdGlhdGVfbXEgdG8gY292ZXIgYWxsIGNhc2VzIG9mIG5l
dyBWQkRzIikKPiBTaWduZWQtb2ZmLWJ5OiBNYW5qdW5hdGggUGF0aWwgPG1hbmp1bmF0aC5iLnBh
dGlsQG9yYWNsZS5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
