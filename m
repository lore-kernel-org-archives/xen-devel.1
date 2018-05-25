From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2] drm/xen-front: fix pointer casts
Date: Fri, 25 May 2018 08:32:23 +0300
Message-ID: <a8cff47d-a990-924a-0a63-b6f3aea3279b__45481.0719973922$1527226277$gmane$org@gmail.com>
References: <20180523113630.29811-1-andr2000@gmail.com>
 <b516542b-a0f5-cbce-d351-25b88a7f3288@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dltw=im=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fM5L3-0002u1-HA
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 05:32:29 +0000
Received: by mail-wm0-x244.google.com with SMTP id a8-v6so10935168wmg.5
 for <xen-devel@lists.xenproject.org>; Thu, 24 May 2018 22:32:27 -0700 (PDT)
In-Reply-To: <b516542b-a0f5-cbce-d351-25b88a7f3288@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel.vetter@intel.com, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjMvMjAxOCAwMjo0NiBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyMy8wNS8x
OCAxMzozNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+IEZyb206IE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4KPj4g
QnVpbGRpbmcgZm9yIGEgMzItYml0IHRhcmdldCByZXN1bHRzIGluIHdhcm5pbmdzIGZyb20gY2Fz
dGluZwo+PiBiZXR3ZWVuIGEgMzItYml0IHBvaW50ZXIgYW5kIGEgNjQtYml0IGludGVnZXIuIEZp
eCB0aGUgd2FybmluZ3MKPj4gYnkgY2FzdGluZyB0aG9zZSBwb2ludGVycyB0byB1aW50cHRyX3Qg
Zmlyc3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgpUaGFuayB5b3UsIGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dAo+
Cj4gSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
