From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH 41/41] scsi: xen-scsifront: mark expected
 switch fall-through
Date: Wed, 28 Nov 2018 21:52:38 -0500
Message-ID: <yq1tvk0y4qx.fsf__43114.8589625538$1543459965$gmane$org@oracle.com>
References: <cover.1543374820.git.gustavo@embeddedor.com>
 <00c2a9d45e39fb294f4995b07a9b7547206c3085.1543374820.git.gustavo@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=auex=OI=oracle.com=martin.petersen@srs-us1.protection.inumbo.net>)
 id 1gSCSk-0000Wf-FW
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 02:53:58 +0000
In-Reply-To: <00c2a9d45e39fb294f4995b07a9b7547206c3085.1543374820.git.gustavo@embeddedor.com>
 (Gustavo A. R. Silva's message of "Tue, 27 Nov 2018 22:34:35 -0600")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Ckd1c3Rhdm8gQS4sCgo+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5nIC1XaW1wbGljaXQtZmFs
bHRocm91Z2gsIG1hcmsgc3dpdGNoIGNhc2VzCj4gd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBm
YWxsIHRocm91Z2guCj4KPiBOb3RpY2UgdGhhdCwgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIEkg
cmVwbGFjZWQKPiAiTWlzc2VkIHRoZSBiYWNrZW5kJ3MgQ2xvc2luZyBzdGF0ZSAtLSBmYWxsdGhy
b3VnaCIgd2l0aAo+ICJmYWxsIHRocm91Z2ggLSBNaXNzZWQgdGhlIGJhY2tlbmQncyBDbG9zaW5n
IHN0YXRlIiwgd2hpY2gKPiBjb250YWlucyB0aGUgImZhbGwgdGhyb3VnaCIgYW5ub3RhdGlvbiBh
dCB0aGUgYmVnaW5uaWcgb2YKPiB0aGUgY29kZSBjb21tZW50LCB3aGljaCBpcyB3aGF0IEdDQyBp
cyBleHBlY3RpbmcgdG8gZmluZC4KCkFwcGxpZWQgdG8gNC4yMS9zY3NpLXF1ZXVlLCB0aGFua3Mh
CgotLSAKTWFydGluIEsuIFBldGVyc2VuCU9yYWNsZSBMaW51eCBFbmdpbmVlcmluZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
