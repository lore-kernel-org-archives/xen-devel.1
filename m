From: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH] xen: hypercall: fix out-of-bounds memcpy
Date: Mon, 5 Feb 2018 13:58:55 +0000
Message-ID: <b24d41d767554cd5bdbd7cd4fc83d30c__45778.9162676365$1517839042$gmane$org@AcuMS.aculab.com>
References: <20180202153240.1190361-1-arnd@arndb.de>
 <aa6e25c7-dc55-a5bf-39cb-8b9453604111@oracle.com>
 <1eddce614f604c518b9bf238a2f92e4b@AcuMS.aculab.com>
 <CAK8P3a0z72S6mY7Q7RBJ_EMCbF9DOi+RdVaUEsB_qo+rGurQ1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bbrw=e7=aculab.com=david.laight@srs-us1.protection.inumbo.net>)
 id 1eihHn-0003JH-TK
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 13:58:19 +0000
In-Reply-To: <CAK8P3a0z72S6mY7Q7RBJ_EMCbF9DOi+RdVaUEsB_qo+rGurQ1g@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: Juergen Gross <jgross@suse.com>, Andi Kleen <ak@linux.intel.com>, Nicolas Pitre <nico@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQXJuZCBCZXJnbWFubg0KPiBTZW50OiAwNSBGZWJydWFyeSAyMDE4IDEyOjM3DQouLi4u
DQo+ID4gQXJlIHRoZSBFVlRDSE5PUF94eHggdmFsdWVzIGRlbnNlPw0KPiA+IEluIHdoaWNoIGNh
c2UgYW4gYXJyYXkgaXMgYWxtb3N0IGNlcnRhaW5seSBiZXR0ZXIgdGhhbiB0aGUgc3dpdGNoIHN0
YXRlbWVudC4NCj4gDQo+IFRoZXkgYXJlLCB5ZXMuIFBIWVNERVZPUF94eHggYXJlIGFsc28gY29u
c2VjdXRpdmUgYnkgc3RhcnQgYXQgJzQnLg0KPiBEYW4gbWFkZSB0aGUgc2FtZSBjb21tZW50IGVh
cmxpZXIsIGFuZCBJIHJlcGxpZWQgdGhhdCBteSBJIGhhZA0KPiBjb25zaWRlcmVkIGl0IGJ1dCB3
ZW50IGZvciB0aGUgbW9yZSBmYWlsc2FmZSByb3V0ZS4gSSBhbHNvIHZlcmlmaWVkIG15DQo+IGFz
c3VtcHRpb24gbm93IHRoYXQgZ2NjIGluIGZhY3QgaXMgc21hcnQgZW5vdWdoIHRvIHR1cm4gdGhp
cw0KPiBpbnRvIGEgdGFibGUgYnkgaXRzZWxmOg0KDQpJJ3ZlIG5ldmVyIHNwb3R0ZWQgdGhhdCBv
cHRpbWlzYXRpb24sIG11c3QgYmUgZmFpcmx5IG5ldy4NCg0KCURhdmlkDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
