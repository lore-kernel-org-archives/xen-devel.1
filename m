From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 4/6] xen: don't free percpu areas during
 suspend
Date: Tue, 02 Apr 2019 05:57:11 -0600
Message-ID: <5CA34E170200007800223E02@prv1-mh.provo.novell.com>
References: <20190402053457.24912-1-jgross@suse.com>
 <20190402053457.24912-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBI2b-0000q7-E9
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 11:57:21 +0000
In-Reply-To: <20190402053457.24912-5-jgross@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA0LjE5IGF0IDA3OjM0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbnN0
ZWFkIG9mIGZyZWVpbmcgcGVyY3B1IGFyZWFzIGR1cmluZyBzdXNwZW5kIGFuZCBhbGxvY2F0aW5n
IHRoZW0KPiBhZ2FpbiB3aGVuIHJlc3VtaW5nIGtlZXAgdGhlbS4gT25seSBmcmVlIGFuIGFyZWEg
aW4gY2FzZSBhIGNwdSBkaWRuJ3QKPiBjb21lIHVwIGFnYWluIHdoZW4gcmVzdW1pbmcuCj4gCj4g
SXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgdGhlcmUgaXMgYSBwb3RlbnRpYWwgY2hhbmdlIGluIGJl
aGF2aW91ciBhcwo+IHRoZSBwZXJjcHUgYXJlYXMgYXJlIG5vIGxvbmdlciB6ZXJvZWQgb3V0IGR1
cmluZyBzdXNwZW5kL3Jlc3VtZS4gV2hpbGUKPiBJIGhhdmUgY2hlY2tlZCB0aGUgY2FsbGVkIGNw
dSBub3RpZmllciBob29rcyB0byBjb3BlIHdpdGggdGhhdCB0aGVyZQo+IG1pZ2h0IGJlIHNvbWUg
d2VsbCBoaWRkZW4gZGVwZW5kZW5jeSBvbiB0aGUgcHJldmlvdXMgYmVoYXZpb3VyLiBPVE9ICj4g
YSBjb21wb25lbnQgbm90IHJlZ2lzdGVyaW5nIGl0c2VsZiBmb3IgY3B1IGRvd24vdXAgYW5kIGV4
cGVjdGluZyB0bwo+IHNlZSBhIHplcm9lZCBwZXJjcHUgdmFyaWFibGUgYWZ0ZXIgc3VzcGVuZC9y
ZXN1bWUgaXMga2luZCBvZiBicm9rZW4KPiBhbHJlYWR5LiBBbmQgdGhlIG9wcG9zaXRlIGNhc2Us
IHdoZXJlIGEgY29tcG9uZW50IGlzIG5vdCByZWdpc3RlcmVkCj4gdG8gYmUgY2FsbGVkIGZvciBj
cHUgZG93bi91cCBhbmQgaXMgbm90IGV4cGVjdGluZyBhIHBlcmNwdSB2YXJpYWJsZQo+IHN1ZGRl
bmx5IHRvIGJlIHplcm8gZHVlIHRvIHN1c3BlbmQvcmVzdW1lIGlzIG11Y2ggbW9yZSBwcm9iYWJs
ZSwKPiBlc3BlY2lhbGx5IGFzIHRoZSBzdXNwZW5kL3Jlc3VtZSBmdW5jdGlvbmFsaXR5IHNlZW1z
IG5vdCB0byBiZSB0ZXN0ZWQKPiB0aGF0IG9mdGVuLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogRGFyaW8gRmFnZ2lvbGkg
PGRmYWdnaW9saUBzdXNlLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpXYXNuJ3QgdGhlcmUgYSByZXF1ZXN0IHRob3VnaCB0byBkbyB0aGUgc2FtZSBvbiBB
cm0/IEV2ZW4gaWYKcmlnaHQgbm93IEFybSBkb2Vzbid0IHN1cHBvcnQgc3VzcGVuZC9yZXN1bWUg
b3V0IG9mIHRoZSBib3gsCkkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGlmIHN1Y2ggcmVsYXRp
dmVseSBnZW5lcmljIGFkanVzdG1lbnRzCndlcmUgZG9uZSBpbiBsb2NrIHN0ZXAuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
