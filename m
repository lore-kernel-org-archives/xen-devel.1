From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/3] x86/altp2m: Add a hvmop for querying
 the suppress #VE bit
Date: Tue, 31 Jul 2018 05:44:03 -0600
Message-ID: <5B604B8302000078001D9692@prv1-mh.provo.novell.com>
References: <20180725111857.22995-1-apop@bitdefender.com>
 <20180725111857.22995-4-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3hbq=kp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fkT4S-0005zC-Ju
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 11:44:08 +0000
In-Reply-To: <20180725111857.22995-4-apop@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Adrian Pop <apop@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA3LjE4IGF0IDEzOjE4LCA8YXBvcEBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvaHZtL2h2bV9vcC5oCj4gQEAgLTM4LDcgKzM4LDcgQEAgc3RydWN0IHhlbl9odm1f
cGFyYW0gewo+ICB0eXBlZGVmIHN0cnVjdCB4ZW5faHZtX3BhcmFtIHhlbl9odm1fcGFyYW1fdDsK
PiAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX2h2bV9wYXJhbV90KTsKPiAgCj4gLXN0cnVj
dCB4ZW5faHZtX2FsdHAybV9zZXRfc3VwcHJlc3NfdmUgewo+ICtzdHJ1Y3QgeGVuX2h2bV9hbHRw
Mm1fc3VwcHJlc3NfdmUgewoKUGxlYXNlIGFkZCB0aGlzIHdpdGhvdXQgdGhlICJzZXRfIiByaWdo
dCBhd2F5IGluIHBhdGNoIDIuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
