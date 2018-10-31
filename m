From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] xen-blkfront: fix kernel panic with
 negotiate_mq error path
Date: Wed, 31 Oct 2018 09:22:25 +0100
Message-ID: <20181031082225.zp2cnrfuinpbilv5__18970.8174359568$1540974104$gmane$org@mac.citrite.net>
References: <1540918161-31283-1-git-send-email-manjunath.b.patil@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7sux=nl=citrix.com=prvs=835290d02=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gHllt-0005zz-RV
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 08:22:37 +0000
Content-Disposition: inline
In-Reply-To: <1540918161-31283-1-git-send-email-manjunath.b.patil@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manjunath Patil <manjunath.b.patil@oracle.com>
Cc: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgMDk6NDk6MjFBTSAtMDcwMCwgTWFuanVuYXRoIFBhdGls
IHdyb3RlOgo+IGluZm8tPm5yX3JpbmdzIGlzbid0IGFkanVzdGVkIGluIGNhc2Ugb2YgRU5PTUVN
IGVycm9yIGZyb20KPiBuZWdvdGlhdGVfbXEoKS4gVGhpcyBsZWFkcyB0byBrZXJuZWwgcGFuaWMg
aW4gZXJyb3IgcGF0aC4KPiAKPiBUeXBpY2FsIGNhbGwgc3RhY2sgaW52b2x2aW5nIHBhbmljIC0K
PiAgIzggcGFnZV9mYXVsdCBhdCBmZmZmZmZmZjgxNzU5MzZmCj4gICAgIFtleGNlcHRpb24gUklQ
OiBibGtpZl9mcmVlX3JpbmcrMzNdCj4gICAgIFJJUDogZmZmZmZmZmZhMDE0OTQ5MSAgUlNQOiBm
ZmZmODgwNGY3NjczYzA4ICBSRkxBR1M6IDAwMDEwMjkyCj4gIC4uLgo+ICAjOSBibGtpZl9mcmVl
IGF0IGZmZmZmZmZmYTAxNDlhYWEgW3hlbl9ibGtmcm9udF0KPiAgIzEwIHRhbGtfdG9fYmxrYmFj
ayBhdCBmZmZmZmZmZmEwMTRjOGNkIFt4ZW5fYmxrZnJvbnRdCj4gICMxMSBibGtiYWNrX2NoYW5n
ZWQgYXQgZmZmZmZmZmZhMDE0ZWE4YiBbeGVuX2Jsa2Zyb250XQo+ICAjMTIgeGVuYnVzX290aGVy
ZW5kX2NoYW5nZWQgYXQgZmZmZmZmZmY4MTQyNDY3MAo+ICAjMTMgYmFja2VuZF9jaGFuZ2VkIGF0
IGZmZmZmZmZmODE0MjZkYzMKPiAgIzE0IHhlbndhdGNoX3RocmVhZCBhdCBmZmZmZmZmZjgxNDIy
ZjI5Cj4gICMxNSBrdGhyZWFkIGF0IGZmZmZmZmZmODEwYWJlNmEKPiAgIzE2IHJldF9mcm9tX2Zv
cmsgYXQgZmZmZmZmZmY4MTc1NDA3OAo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4g
Rml4ZXM6IDdlZDhjZTFjNWZjNyAoInhlbi1ibGtmcm9udDogbW92ZSBuZWdvdGlhdGVfbXEgdG8g
Y292ZXIgYWxsIGNhc2VzIG9mIG5ldyBWQkRzIikKPiBTaWduZWQtb2ZmLWJ5OiBNYW5qdW5hdGgg
UGF0aWwgPG1hbmp1bmF0aC5iLnBhdGlsQG9yYWNsZS5jb20+CgpBY2tlZC1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
