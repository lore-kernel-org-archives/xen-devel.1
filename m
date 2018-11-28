From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 41/41] scsi: xen-scsifront: mark expected
 switch fall-through
Date: Wed, 28 Nov 2018 07:03:02 +0100
Message-ID: <a17db312-3e7c-113b-a8a1-ff444322c233__30697.7467648268$1543384921$gmane$org@suse.com>
References: <cover.1543374820.git.gustavo@embeddedor.com>
 <00c2a9d45e39fb294f4995b07a9b7547206c3085.1543374820.git.gustavo@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=+lgq=oh=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gRswE-0000dp-4S
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 06:03:06 +0000
In-Reply-To: <00c2a9d45e39fb294f4995b07a9b7547206c3085.1543374820.git.gustavo@embeddedor.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMTEvMjAxOCAwNTozNCwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiBJbiBwcmVw
YXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3aXRjaCBj
YXNlcwo+IHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLgo+IAo+IE5vdGlj
ZSB0aGF0LCBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgSSByZXBsYWNlZAo+ICJNaXNzZWQgdGhl
IGJhY2tlbmQncyBDbG9zaW5nIHN0YXRlIC0tIGZhbGx0aHJvdWdoIiB3aXRoCj4gImZhbGwgdGhy
b3VnaCAtIE1pc3NlZCB0aGUgYmFja2VuZCdzIENsb3Npbmcgc3RhdGUiLCB3aGljaAo+IGNvbnRh
aW5zIHRoZSAiZmFsbCB0aHJvdWdoIiBhbm5vdGF0aW9uIGF0IHRoZSBiZWdpbm5pZyBvZgo+IHRo
ZSBjb2RlIGNvbW1lbnQsIHdoaWNoIGlzIHdoYXQgR0NDIGlzIGV4cGVjdGluZyB0byBmaW5kLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRv
ci5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
