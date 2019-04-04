From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] ALSA: xen-front: Do not use stream buffer
 size before it is set
Date: Thu, 4 Apr 2019 14:42:44 +0200
Message-ID: <4a852738-7dc1-09df-165b-a133486e3bb7__24568.8712968089$1554381827$gmane$org@suse.com>
References: <20190404123838.22162-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KwgS=SG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hC1hj-0000la-12
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 12:42:51 +0000
In-Reply-To: <20190404123838.22162-1-andr2000@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, perex@perex.cz, tiwai@suse.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDQvMjAxOSAxNDozOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gRnJv
bTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0u
Y29tPgo+IAo+IFRoaXMgZml4ZXMgdGhlIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCB3aGlsZSBtb3Zp
bmcgdG8gWGVuIHNoYXJlZAo+IGJ1ZmZlciBpbXBsZW1lbnRhdGlvbi4KPiAKPiBGaXhlczogNThm
OWQ4MDZkMTZhICgiQUxTQTogeGVuLWZyb250OiBVc2UgWGVuIGNvbW1vbiBzaGFyZWQgYnVmZmVy
IGltcGxlbWVudGF0aW9uIikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CgpSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
