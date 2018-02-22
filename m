From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/pvcalls: fix null pointer dereference
	on map->sock
Date: Thu, 22 Feb 2018 20:19:51 +0100
Message-ID: <ad17f925-bf95-967d-45d8-3248aea6ddcd@suse.com>
References: <20180222172259.10381-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=d841=fq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eowPX-0005tT-Hd
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 19:20:07 +0000
In-Reply-To: <20180222172259.10381-1-colin.king@canonical.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Colin King <colin.king@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMTggMTg6MjIsIENvbGluIEtpbmcgd3JvdGU6Cj4gRnJvbTogQ29saW4gSWFuIEtp
bmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBDdXJyZW50bHkgaWYgbWFwIGlzIG51
bGwgdGhlbiBhIHBvdGVudGlhbCBudWxsIHBvaW50ZXIgZGVmZXJlbmNlCj4gb2NjdXJzIHdoZW4g
Y2FsbGluZyBzb2NrX3JlbGVhc2Ugb24gbWFwLT5zb2NrLiAgSSBiZWxpZXZlIHRoZQo+IGFjdHVh
bCBpbnRlbnRpb24gd2FzIHRvIGNhbGwgc29ja19yZWxlYXNlIG9uIHNvY2sgaW5zdGVhZC4gRml4
Cj4gdGhpcy4KPiAKPiBGaXhlczogNWRiNGQyODZhOGVmICgieGVuL3B2Y2FsbHM6IGltcGxlbWVu
dCBjb25uZWN0IGNvbW1hbmQiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xp
bi5raW5nQGNhbm9uaWNhbC5jb20+CgpIbW0sIHllcywga2luZCBvZiBvYnZpb3VzLiA6LSkKClJl
dmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
