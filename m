From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] build: remove shim related targets
Date: Tue, 20 Feb 2018 09:00:21 -0700
Message-ID: <5A8C542502000078001A9AA1@prv-mh.provo.novell.com>
References: <20180220143754.31260-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wunw=fo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eoALI-0007md-DQ
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 16:00:32 +0000
In-Reply-To: <20180220143754.31260-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE4IGF0IDE1OjM3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKPiArKysgYi90b29scy9maXJt
d2FyZS94ZW4tZGlyL01ha2VmaWxlCj4gQEAgLTQ4LDEzICs0OCwxNCBAQCBzaGltLSVjb25maWc6
ICQoRCkgRk9SQ0UKPiAgCQlLQ09ORklHX0NPTkZJRz0kKENVUkRJUikvc2hpbS5jb25maWcKPiAg
Cj4gIHhlbi1zaGltOiAkKEQpIHNoaW0tb2xkZGVmY29uZmlnCj4gLQkkKE1BS0UpIC1DICQoRCkv
eGVuIGluc3RhbGwtc2hpbSBcCj4gKwkkKE1BS0UpIC1DICQoRCkveGVuIGJ1aWxkIFwKPiAgCQlY
RU5fQ09ORklHX0VYUEVSVD15IFwKPiAtCQlLQ09ORklHX0NPTkZJRz0kKENVUkRJUikvc2hpbS5j
b25maWcgXAo+IC0JCURFU1RESVI9JChDVVJESVIpCj4gKwkJS0NPTkZJR19DT05GSUc9JChDVVJE
SVIpL3NoaW0uY29uZmlnCj4gKwlsbiAtc2YgJChEKS94ZW4veGVuIHhlbi1zaGltCj4gKwlsbiAt
c2YgJChEKS94ZW4veGVuLXN5bXMgeGVuLXNoaW0tc3ltcwoKSSB0aGluayBpdCBpcyBhZHZpc2Fi
bGUgdG8gdXNlICRAIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcgdGhlIHRhcmdldC4KCj4gQEAgLTE1
MSw5ICsxNDQsNiBAQCAkKFRBUkdFVCk6IGRlbGV0ZS11bmZyZXNoLWZpbGVzCj4gIAkkKE1BS0Up
IC1mICQoQkFTRURJUikvUnVsZXMubWsgaW5jbHVkZS9hc20tJChUQVJHRVRfQVJDSCkvYXNtLW9m
ZnNldHMuaAo+ICAJJChNQUtFKSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1DIGFyY2gvJChUQVJH
RVRfQVJDSCkgJChUQVJHRVQpCj4gIAo+IC0kKFRBUkdFVCktc2hpbTogJChUQVJHRVQpCj4gLQkk
KE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMgYXJjaC8kKFRBUkdFVF9BUkNIKSAkKFRB
UkdFVCktc2hpbQoKSSB0aGluayB5b3UgbmVlZCB0byByZWJhc2Ugb3ZlciB0aGUgY2hhbmdlIEkn
dmUgY29tbWl0dGVkIGVhcmxpZXIKdG9kYXkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
