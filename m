From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 3/3] Input: xen-kbdfront - allow better
 run-time configuration
Date: Tue, 12 Jun 2018 15:50:08 +0200
Message-ID: <5fbac8d0-a3cf-af8a-690e-947752a53ab6__2556.00646273724$1528811337$gmane$org@suse.com>
References: <20180612074856.28451-1-andr2000@gmail.com>
 <20180612074856.28451-4-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=w5bd=i6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fSjgb-0002PA-CJ
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 13:50:13 +0000
In-Reply-To: <20180612074856.28451-4-andr2000@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, lyan@suse.com, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, andrii_chepurnyi@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDYvMTggMDk6NDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+IEZyb206
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4KPiAKPiBJdCBpcyBub3cgb25seSBwb3NzaWJsZSB0byBjb250cm9sIGlmIG11bHRpLXRvdWNo
IHZpcnR1YWwgZGV2aWNlCj4gaXMgY3JlYXRlZCBvciBub3QgKHZpYSB0aGUgY29ycmVzcG9uZGlu
ZyBYZW5TdG9yZSBlbnRyaWVzKSwKPiBidXQga2V5Ym9hcmQgYW5kIHBvaW50ZXIgZGV2aWNlcyBh
cmUgYWx3YXlzIGNyZWF0ZWQuCj4gSW4gc29tZSBjYXNlcyB0aGlzIGlzIG5vdCBkZXNpcmFibGUu
IEZvciBleGFtcGxlLCBpZiB2aXJ0dWFsCj4ga2V5Ym9hcmQgZGV2aWNlIGlzIGV4cG9zZWQgdG8g
QW5kcm9pZCB0aGVuIHRoZSBsYXR0ZXIgd29uJ3QKPiBhdXRvbWF0aWNhbGx5IHNob3cgb24tc2Ny
ZWVuIGtleWJvYXJkIGFzIGl0IGV4cGVjdHMgdGhhdCBhCj4gcGh5c2ljYWwga2V5Ym9hcmQgZGV2
aWNlIGNhbiBiZSB1c2VkIGZvciB0eXBpbmcuCj4gCj4gVXRpbGl6ZSBrZXlib2FyZCBhbmQgcG9p
bnRlciBkZXZpY2UgWGVuU3RvcmUgZmVhdHVyZSBmaWVsZHMgdG8KPiBjb25maWd1cmUgd2hpY2gg
dmlydHVhbCBkZXZpY2VzIGFyZSBjcmVhdGVkOgo+ICAtIHNldCAiZmVhdHVyZS1kaXNhYmxlLWtl
eWJvYXJkIiB0byAxIGlmIG5vIGtleWJvYXJkIGRldmljZQo+ICAgIG5lZWRzIHRvIGJlIGNyZWF0
ZWQKPiAgLSBzZXQgImZlYXR1cmUtZGlzYWJsZS1wb2ludGVyIiB0byAxIGlmIG5vIHBvaW50ZXIg
ZGV2aWNlCj4gICAgbmVlZHMgdG8gYmUgY3JlYXRlZAo+IEtlZXAgb2xkIGJlaGF2aW9yIGJ5IGRl
ZmF1bHQuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IFN1Z2dlc3RlZC1ieTogQW5kcmlpIENoZXB1
cm55aSA8YW5kcmlpX2NoZXB1cm55aUBlcGFtLmNvbT4KPiBUZXN0ZWQtYnk6IEFuZHJpaSBDaGVw
dXJueWkgPGFuZHJpaV9jaGVwdXJueWlAZXBhbS5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
