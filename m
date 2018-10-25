From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/pvh: don't try to unplug emulated
 devices
Date: Thu, 25 Oct 2018 08:03:33 -0400
Message-ID: <420b4720-801c-542f-5b9c-5d35e2276c33__36056.9117860452$1540468955$gmane$org@oracle.com>
References: <20181025075415.18798-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p7ej=nf=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gFeMV-0002RF-TE
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 12:03:39 +0000
In-Reply-To: <20181025075415.18798-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjUvMTggMzo1NCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBIFhlbiBQVkggZ3Vl
c3QgaGFzIG5vIGFzc29jaWF0ZWQgcWVtdSBkZXZpY2UgbW9kZWwsIHNvIHRyeWluZyB0bwo+IHVu
cGx1ZyBhbnkgZW11bGF0ZWQgZGV2aWNlcyBpcyBtYWtpbmcgbm8gc2Vuc2UgYXQgYWxsLgo+Cj4g
QmFpbCBvdXQgZWFybHkgZnJvbSB4ZW5fdW5wbHVnX2VtdWxhdGVkX2RldmljZXMoKSB3aGVuIHJ1
bm5pbmcgYXMgUFZICj4gZ3Vlc3QuIFRoaXMgd2lsbCBhdm9pZCBpc3N1aW5nIHRoZSBib290IG1l
c3NhZ2U6Cj4KPiBbICAgIDAuMDAwMDAwXSBYZW4gUGxhdGZvcm0gUENJOiB1bnJlY29nbmlzZWQg
bWFnaWMgdmFsdWUKPgo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA0LjExCj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6
IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
