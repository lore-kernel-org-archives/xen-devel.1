From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen/netfront: tolerate frags with no data
Date: Tue, 18 Dec 2018 22:00:13 -0800 (PST)
Message-ID: <20181218.220013.1743575331051422957.davem__9041.50583451173$1545199165$gmane$org@davemloft.net>
References: <20181218150619.6964-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0aJC=O4=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1gZUtz-0006gD-VN
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 06:00:15 +0000
In-Reply-To: <20181218150619.6964-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com
Cc: sstabellini@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpEYXRlOiBUdWUsIDE4IERlYyAy
MDE4IDE2OjA2OjE5ICswMTAwCgo+IEF0IGxlYXN0IG9sZCBYZW4gbmV0IGJhY2tlbmRzIHNlZW0g
dG8gc2VuZCBmcmFncyB3aXRoIG5vIHJlYWwgZGF0YQo+IHNvbWV0aW1lcy4gSW4gY2FzZSBzdWNo
IGEgZnJhZ21lbnQgaGFwcGVucyB0byBvY2N1ciB3aXRoIHRoZSBmcmFnIGxpbWl0Cj4gYWxyZWFk
eSByZWFjaGVkIHRoZSBmcm9udGVuZCB3aWxsIEJVRyBjdXJyZW50bHkgZXZlbiBpZiB0aGlzIHNp
dHVhdGlvbgo+IGlzIGVhc2lseSByZWNvdmVyYWJsZS4KPiAKPiBNb2RpZnkgdGhlIEJVR19PTigp
IGNvbmRpdGlvbiBhY2NvcmRpbmdseS4KPiAKPiBUZXN0ZWQtYnk6IERpZXRtYXIgSGFobiA8ZGll
dG1hci5oYWhuQHRzLmZ1aml0c3UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCkFwcGxpZWQgYW5kIHF1ZXVlZCB1cCBmb3IgLXN0YWJsZS4KCkJ1
dCBtYW55IG9mIHRoZXNlIEJVRydzIGluIHRoZSBkcml2ZXIgc2hvdWxkIGJlIGNvbnZlcnRlZCB0
bwpXQVJOcyBhbmQgcmVjb3ZlcnkgY29kZSBhZGRlZC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
