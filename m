From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 49/60] xen/sched: reject switching smt
 on/off with core scheduling active
Date: Tue, 28 May 2019 05:44:03 -0600
Message-ID: <5CED1F030200007800233129@prv1-mh.provo.novell.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-50-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVaWY-0000J2-Iw
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 11:44:10 +0000
In-Reply-To: <20190528103313.1343-50-jgross@suse.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjMzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPiBA
QCAtMjAwLDcgKzIwMCw4IEBAIGxvbmcgYXJjaF9kb19zeXNjdGwoCj4gIAo+ICAgICAgICAgIGNh
c2UgWEVOX1NZU0NUTF9DUFVfSE9UUExVR19TTVRfRU5BQkxFOgo+ICAgICAgICAgIGNhc2UgWEVO
X1NZU0NUTF9DUFVfSE9UUExVR19TTVRfRElTQUJMRToKPiAtICAgICAgICAgICAgaWYgKCAhY3B1
X2hhc19odHQgfHwgYm9vdF9jcHVfZGF0YS54ODZfbnVtX3NpYmxpbmdzIDwgMiApCj4gKyAgICAg
ICAgICAgIGlmICggIWNwdV9oYXNfaHR0IHx8IGJvb3RfY3B1X2RhdGEueDg2X251bV9zaWJsaW5n
cyA8IDIgfHwKPiArICAgICAgICAgICAgICAgICBzY2hlZF9kaXNhYmxlX3NtdF9zd2l0Y2hpbmcg
KQo+ICAgICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsK
PiAgICAgICAgICAgICAgICAgIGJyZWFrOwoKSSdtIG5vdCBjb252aW5jZWQgLUVPUE5PVFNVUFAg
aXMgYW4gYXBwcm9wcmlhdGUgZXJyb3IgY29kZSBmb3IKdGhpcyBuZXcgY2FzZS4gLUVQRVJNLCAt
RUFDQ0VTLCBvciAtRUlPIHdvdWxkIGFsbCBzZWVtIG1vcmUKYXBwcm9wcmlhdGUgdG8gbWUgKGFu
ZCBwZXJoYXBzIHRoZXJlIGFyZSBmdXJ0aGVyIG9uZXMpLgoKPiAtLS0gYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtNTcsNiArNTcsNyBA
QCBpbnRlZ2VyX3BhcmFtKCJzY2hlZF9yYXRlbGltaXRfdXMiLCBzY2hlZF9yYXRlbGltaXRfdXMp
Owo+ICAKPiAgLyogTnVtYmVyIG9mIHZjcHVzIHBlciBzdHJ1Y3Qgc2NoZWRfdW5pdC4gKi8KPiAg
c3RhdGljIHVuc2lnbmVkIGludCBzY2hlZF9ncmFudWxhcml0eSA9IDE7Cj4gK2Jvb2wgc2NoZWRf
ZGlzYWJsZV9zbXRfc3dpdGNoaW5nOwoKX19yZWFkX21vc3RseSAocGVyaGFwcyBhbHNvIHRoZSBw
cmUtZXhpc3RpbmcgdmFyaWFibGUgaW4gY29udGV4dCk/CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
