From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] pvcalls-front: wait for other
 operations to return when release passive sockets
Date: Mon, 12 Feb 2018 14:39:24 +0100
Message-ID: <e2d6f037-cb0c-7669-0efc-c1e9bcf69a07__17542.2698529021$1518442740$gmane$org@suse.com>
References: <alpine.DEB.2.10.1802051448460.10160@sstabellini-ThinkPad-X260>
 <1517871107-15349-1-git-send-email-sstabellini@kernel.org>
 <1517871107-15349-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wvyf=fg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1elEKS-0004dw-Rr
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 13:39:32 +0000
In-Reply-To: <1517871107-15349-2-git-send-email-sstabellini@kernel.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Cc: Stefano Stabellini <stefano@aporeto.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMTggMjM6NTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBQYXNzaXZlIHNv
Y2tldHMgY2FuIGhhdmUgb25nb2luZyBvcGVyYXRpb25zIG9uIHRoZW0sIHNwZWNpZmljYWxseSwg
d2UKPiBoYXZlIHR3byB3YWl0X2V2ZW50X2ludGVycnVwdGFibGUgY2FsbHMgaW4gcHZjYWxsc19m
cm9udF9hY2NlcHQuCj4gCj4gQWRkIHR3byB3YWtlX3VwIGNhbGxzIGluIHB2Y2FsbHNfZnJvbnRf
cmVsZWFzZSwgdGhlbiB3YWl0IGZvciB0aGUKPiBwb3RlbnRpYWwgd2FpdGVycyB0byByZXR1cm4g
YW5kIHJlbGVhc2UgdGhlIHNvY2tfbWFwcGluZyByZWZjb3VudC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9AYXBvcmV0by5jb20+CgpBY2tlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
