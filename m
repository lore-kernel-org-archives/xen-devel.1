From: Vasilis Liaskovitis <vliaskovitis@suse.com>
Subject: Re: [PATCH v2] xen/blkfront: avoid NULL blkfront_info
 dereference on device removal
Date: Mon, 15 Oct 2018 16:25:56 +0200
Message-ID: <b0b793a6cdfd634e126fbb00554ca68a780a00bd.camel__1507.19515881992$1539613491$gmane$org@suse.com>
References: <20181015132508.23293-1-vliaskovitis@suse.com>
 <20181015140201.elir7ettk7sz4aix@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ieol=m3=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1gC3p0-0004Kl-68
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 14:26:14 +0000
In-Reply-To: <20181015140201.elir7ettk7sz4aix@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMDE4LTEwLTE1IGF0IDE2OjAyICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+IAo+ID4gVGhpcyByZXN1bHRzIGluIGEgTlVMTCBwb2ludGVyIEJVRyB3aGVuIGJsa2Zyb250
X3JlbW92ZSBhbmQKPiA+IGJsa2lmX2ZyZWUKPiA+IHRyeSB0byBhY2Nlc3MgdGhlIGZhaWxpbmcg
ZGV2aWNlJ3MgTlVMTCBzdHJ1Y3QgYmxrZnJvbnRfaW5mby4KPiA+IAo+ID4gCj4gSSBndWVzcyB0
aGlzIGlzIGEgY2FuZGlkYXRlIGZvciBiYWNrcG9ydGluZz8KPiAKCnllcywgSSB0aGluayBzby4g
QXQgbGVhc3QgZm9yIGtlcm5lbHMgPj00LjUsIHdoaWNoIGNvdWxkIGZhY2UgdGhpcwppc3N1ZSBk
dWUgdG8gY29tbWl0IGMzMWVjZjZjMTIgKHRoaXMgZnJlZXMgdGhlIHN0cnVjdCBibGtpbmZvIGlu
IHRoZQpmYWlsaW5nIHBhdGggb2YgdGFsa190b19ibGtiYWNrKS4KCnRoYW5rcywgCgotIFZhc2ls
aXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
