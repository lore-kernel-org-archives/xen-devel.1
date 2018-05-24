From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [GIT PULL] (swiotlb) stable/for-linus-4.17
Date: Thu, 24 May 2018 17:23:55 -0400
Message-ID: <20180524212355.GB5947__49833.0461829484$1527196978$gmane$org@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7001249495543468161=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oeky=il=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1fLxiM-0001fl-LL
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 21:24:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: joe.jin@oracle.com
List-Id: xen-devel@lists.xenproject.org


--===============7001249495543468161==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Linus,

Please git pull the following branch in your tree:

git pull git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git stable/for-linus-4.17

There is one single fix in there - that is under Xen the DMA32 heap
(in the hypervisor) would end up looking like swiss cheese. The reason
being that for every coherent DMA allocation we didn't do the proper
hypercall to tell Xen to return the page back to the DMA32 heap.
End result was (eventually) no DMA32 space if say you say continously
unloaded and loaded modules.

Thank you.

 drivers/xen/swiotlb-xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Joe Jin (1):
      xen-swiotlb: fix the check condition for xen_swiotlb_free_coherent


--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJbBy1rAAoJEFKlDoTx2wm/jnoP/jvxyAetAQzmicIdeHL0NlCa
qEWM8CU8NmyCXjncJGNJ93ZWt1yZuVXayUwwwYDCCZ4UJ9jN6bGCRpaOiebSfS7A
MDzjvbAtMOQh6eJQRM4ZMm1Pst7y91+3jdSwKr/+ULYrdODeGfPrNnYzu8S2S8k8
lOgC85cdl7TKwc8aWZttJE85s8ozBgtjsDayvDOogmgPnUdAwPeamp3G2jnZSCVC
EnB0/AIpbM59nZYZq6WUwOhW+j9g+uyiBVug+/AxMS+7S30KB/ES1k1xSsNM/Eop
korh7VYAJe7RBHjKkHs7qwuVK/M3PaiDEw9TZ4MCkG+KlF6GCOVsSZ4OuSSvhIFc
8YicBqr6GGbImw4g5RX4VK6TkPNm5YUxSs5rDuVldR2/bBX3GoOCqAyaBUzoafQu
5ZAoMGoAILEdmG/yUtT3Nm+WZGUNV5VG1D2SIJRYf1K5hBmCBwN4/HRrl1mLUugh
5aw1KpWke7k2YhymFVgup5ejjeoeLEkUQDHKMSYYZ8faTakm+2g62L5i+30FvBpx
gwk1EVizvQYjvu7Ywg2KYcaNK1FCph4byIiuNPBj5KRFuS6PDdZGnFcUvejdOwAA
T7EKkKPVLoQ08VLd1YD9SmU1pLyZ09DcnhLOI9mSzay/X4fLoFtCgW7ZLpj5vQ4F
eKjCD1fAR322wDdA0vsi
=Kiui
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--


--===============7001249495543468161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7001249495543468161==--
