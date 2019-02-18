From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12 v2] xen/arm: domain_build: Require
 the property "cpus" when building a domU
Date: Mon, 18 Feb 2019 12:34:37 +0100
Message-ID: <65eff758-4dca-5c40-051d-b1282477dc87@suse.com>
References: <20190218101436.31127-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gvhC5-0001hS-3F
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 11:34:41 +0000
In-Reply-To: <20190218101436.31127-1-julien.grall@arm.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDIvMjAxOSAxMToxNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSAzcmQgYXJndW1l
bnQgb2YgZnVuY3Rpb24gZHRfcHJvcGVydHlfcmVhZF91MzIoKSBpcyBvbmx5IHZhbGlkIHdoZW4K
PiB0aGUgY2FsbCBzdWNjZWVkZWQuIFNvIHdlIGNhbm5vdCBhc3N1bWUgdGhlIHZhbHVlIHdpbGwg
bm90IGJlIG1vZGlmZWQKPiBpbiBjYXNlIG9mIGZhaWx1cmUuCj4gCj4gVGhlIGRvY3VtZW50YXRp
b24gb2YgRG9tMGxlc3MgZG9lcyBub3QgZ2l2ZSBhIGRlZmF1bHQgdmFsdWUgd2hlbiB0aGUKPiBw
cm9wZXJ0eSAiY3B1cyIgaXMgbm90IHNldC4gU28gcmVxdWlyZSB0aGUgcHJvcGVydHkgaW4gdGhl
IGNvbmZpZ3VyYXRpb24uCj4gCj4gQ292ZXJpdHktSUQ6IDE0NzY4MjUKPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmVsZWFzZS1hY2tlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
