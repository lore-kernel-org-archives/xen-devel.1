From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 13/20] xenbus: drop useless LIST_HEAD
Date: Tue, 8 Jan 2019 07:58:07 +0100
Message-ID: <168d6809-80e0-d639-19a1-eab2ee47765e__8795.30401803113$1546930618$gmane$org@suse.com>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
 <1545555435-24576-14-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gglL3-000149-0q
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 06:58:13 +0000
In-Reply-To: <1545555435-24576-14-git-send-email-Julia.Lawall@lip6.fr>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julia Lawall <Julia.Lawall@lip6.fr>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTIvMjAxOCAwOTo1NywgSnVsaWEgTGF3YWxsIHdyb3RlOgo+IERyb3AgTElTVF9IRUFE
IHdoZXJlIHRoZSB2YXJpYWJsZSBpdCBkZWNsYXJlcyBpcyBuZXZlciB1c2VkLgo+IAo+IFRoZSBk
ZWNsYXJhdGlvbnMgd2VyZSBpbnRyb2R1Y2VkIHdpdGggdGhlIGZpbGUsIGJ1dCB0aGUgZGVjbGFy
ZWQKPiB2YXJpYWJsZXMgd2VyZSBub3QgdXNlZC4KPiAKPiBUaGUgc2VtYW50aWMgcGF0Y2ggdGhh
dCBmaXhlcyB0aGlzIHByb2JsZW0gaXMgYXMgZm9sbG93czoKPiAoaHR0cDovL2NvY2NpbmVsbGUu
bGlwNi5mci8pCj4gCj4gLy8gPHNtcGw+Cj4gQEAKPiBpZGVudGlmaWVyIHg7Cj4gQEAKPiAtIExJ
U1RfSEVBRCh4KTsKPiAgIC4uLiB3aGVuICE9IHgKPiAvLyA8L3NtcGw+Cj4gCj4gRml4ZXM6IDEx
MDdiYTg4NWU0NiAoInhlbjogYWRkIHhlbmZzIHRvIGFsbG93IHVzZXJtb2RlIDwtPiBYZW4gaW50
ZXJhY3Rpb24iKQo+IFNpZ25lZC1vZmYtYnk6IEp1bGlhIExhd2FsbCA8SnVsaWEuTGF3YWxsQGxp
cDYuZnI+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
