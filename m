From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/gntdev: fix up blockable calls to
 mn_invl_range_start
Date: Thu, 23 Aug 2018 09:46:40 -0400
Message-ID: <565d0ef0-4723-bd1b-95de-cb9aba50fe20__32993.6247122989$1535031848$gmane$org@oracle.com>
References: <20180823120707.10998-1-mhocko@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wcce=lg=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fspvR-0006uY-5z
 for xen-devel@lists.xenproject.org; Thu, 23 Aug 2018 13:45:25 +0000
In-Reply-To: <20180823120707.10998-1-mhocko@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Juergen Gross <jgross@suse.com>, Michal Hocko <mhocko@suse.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMjMvMjAxOCAwODowNyBBTSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+IEZyb206IE1pY2hh
bCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+Cj4gOTMwNjVhYzc1M2U0ICgibW0sIG9vbTogZGlz
dGluZ3Vpc2ggYmxvY2thYmxlIG1vZGUgZm9yIG1tdSBub3RpZmllcnMiKQo+IGhhcyBpbnRyb2R1
Y2VkIGJsb2NrYWJsZSBwYXJhbWV0ZXIgdG8gYWxsIG1tdV9ub3RpZmllcnMgYW5kIHRoZSBub3Rp
Zmllcgo+IGhhcyB0byBiYWNrIG9mZiB3aGVuIGNhbGxlZCBpbiAhYmxvY2thYmxlIGNhc2UgYW5k
IGl0IGNvdWxkIGJsb2NrIGRvd24KPiB0aGUgcm9hZC4KPgo+IFRoZSBhYm92ZSBjb21taXQgaW1w
bGVtZW50ZWQgdGhhdCBmb3IgbW5faW52bF9yYW5nZV9zdGFydCBidXQgYm90aAo+IGluX3Jhbmdl
IGNoZWNrcyBhcmUgZG9uZSB1bmNvbmRpdGlvbmFsbHkgcmVnYXJkbGVzcyBvZiB0aGUgYmxvY2th
YmxlCj4gbW9kZSBhbmQgYXMgc3VjaCB0aGV5IHdvdWxkIGZhaWwgYWxsIHRoZSB0aW1lIGZvciBy
ZWd1bGFyIGNhbGxzLgo+IEZpeCB0aGlzIGJ5IGNoZWNraW5nIGJsb2NrYWJsZSBwYXJhbWV0ZXIg
YXMgd2VsbC4KPgo+IE9uY2Ugd2UgYXJlIHRoZXJlIHdlIGNhbiByZW1vdmUgdGhlIHN0YWxlIFRP
RE8uIFRoZSBsb2NrIGhhcyB0byBiZQo+IHNsZWVwYWJsZSBiZWNhdXNlIHdlIHdhaXQgZm9yIGNv
bXBsZXRpb24gZG93biBpbiBnbnR0YWJfdW5tYXBfcmVmc19zeW5jLgo+Cj4gRml4ZXM6IDkzMDY1
YWM3NTNlNCAoIm1tLCBvb206IGRpc3Rpbmd1aXNoIGJsb2NrYWJsZSBtb2RlIGZvciBtbXUgbm90
aWZpZXJzIikKPiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJv
dnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNlbC5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
