From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] xen: add interface for obtaining
 .config from hypervisor
Date: Mon, 28 Jan 2019 04:40:23 -0700
Message-ID: <5C4EEA270200007800211AE0@prv1-mh.provo.novell.com>
References: <20190117145722.30311-1-jgross@suse.com>
 <20190117145722.30311-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1go5HC-0001xO-5G
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 11:40:30 +0000
In-Reply-To: <20190117145722.30311-2-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE5IGF0IDE1OjU3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
ODMsMyArODQsOSBAQCBzdWJkaXItJChDT05GSUdfVUJTQU4pICs9IHVic2FuCj4gIAo+ICBzdWJk
aXItJChDT05GSUdfTkVFRFNfTElCRUxGKSArPSBsaWJlbGYKPiAgc3ViZGlyLSQoQ09ORklHX0hB
U19ERVZJQ0VfVFJFRSkgKz0gbGliZmR0Cj4gKwo+ICtjb25maWdfZGF0YS5jOiAuLi8uY29uZmln
Cj4gKwkoIGVjaG8gImNvbnN0IGNoYXIgeGVuX2NvbmZpZ19kYXRhW10gPSI7IFwKPiArCSAgY2F0
ICQ8IHwgZ3ppcCB8IC4uL3Rvb2xzL2JpbjJjOyBcCj4gKwkgIGVjaG8gIjsiOyBcCj4gKwkgIGVj
aG8gInVuc2lnbmVkIGludCB4ZW5fY29uZmlnX2RhdGFfc3ogPSBzaXplb2YoeGVuX2NvbmZpZ19k
YXRhKSAtIDE7IiApID4gJEAKCmNvbnN0IGhlcmUgYXMgd2VsbCBwbGVhc2UuIFdpdGggdGhpcyBh
ZGp1c3RlZApSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgooYXBh
cnQgZnJvbSB0aGUgWFNNIGNoYW5nZXMpCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
