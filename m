From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen: add call of
 speculative_store_bypass_ht_init() to pv paths
Date: Thu, 21 Jun 2018 09:01:59 -0400
Message-ID: <0637b981-c3cf-b1e7-5c1b-41f77bedc290__47099.5744843551$1529586061$gmane$org@oracle.com>
References: <20180621084331.21228-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dgab=jh=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fVzEA-00052s-8y
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 13:02:18 +0000
In-Reply-To: <20180621084331.21228-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, stable@vger.kernel.org, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMjEvMjAxOCAwNDo0MyBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBDb21taXQgMWY1
MGRkYjRmNDE4OTI0M2MwNTkyNmI4NDJkYzFhMDMzMjE5NWYzMSAoIng4Ni9zcGVjdWxhdGlvbjoK
PiBIYW5kbGUgSFQgY29ycmVjdGx5IG9uIEFNRCIpIGFkZGVkIHNwZWN1bGF0aXZlX3N0b3JlX2J5
cGFzc19odF9pbml0KCkKPiB0byB0aGUgcGVyLWNwdSBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZS4K
Pgo+IHNwZWN1bGF0aXZlX3N0b3JlX2J5cGFzc19odF9pbml0KCkgbmVlZHMgdG8gYmUgY2FsbGVk
IG9uIGVhY2ggY3B1IGZvcgo+IHB2IGd1ZXN0cywgdG9vLgo+Cj4gUmVwb3J0ZWQtYnk6IEJyaWFu
IFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgo+IEZpeGVzOiAxZjUwZGRiNGY0MTg5MjQzYzA1
OTI2Yjg0MmRjMWEwMzMyMTk1ZjMxICgieDg2L3NwZWN1bGF0aW9uOiBIYW5kbGUgSFQgY29ycmVj
dGx5IG9uIEFNRCIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBUZXN0ZWQtYnk6IEJyaWFuIFdv
b2RzIDxicmlhbi53b29kc0BhbWQuY29tPgo+CgoKClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zz
a3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
