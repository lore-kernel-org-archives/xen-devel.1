From: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH v1 8/8] PM / Hibernate: exclude all
 PageOffline() pages
Date: Wed, 21 Nov 2018 04:35:46 -0700
Message-ID: <11E3C0B0-AEED-42C6-A21C-1820F4B47A68__12101.988544646$1542800107$gmane$org@oracle.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-9-david@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z0b1=oa=oracle.com=william.kucharski@srs-us1.protection.inumbo.net>)
 id 1gPQny-0000dZ-4Z
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 11:36:26 +0000
In-Reply-To: <20181119101616.8901-9-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Len Brown <len.brown@intel.com>, Michal Hocko <mhocko@suse.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

SWYgeW91IGFyZSBhZGRpbmcgUGFnZU9mZmxpbmUocGFnZSkgdG8gdGhlIGNvbmRpdGlvbiBsaXN0
IG9mIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGlmIGluCnNhdmVhYmxlX2hpZ2htZW1fcGFnZSgpLCB3
aHkgZXhwbGljaXRseSBhZGQgaXQgYXMgYSBzZXBhcmF0ZSBzdGF0ZW1lbnQgaW4gc2F2ZWFibGVf
cGFnZSgpPwoKSXQgd291bGQgc2VlbSBtb3JlIGNvbnNpc3RlbnQgdG8gbWFrZSB0aGUgc2Vjb25k
IGNoZWNrOgoKLQlpZiAoc3dzdXNwX3BhZ2VfaXNfZm9yYmlkZGVuKHBhZ2UpIHx8IHN3c3VzcF9w
YWdlX2lzX2ZyZWUocGFnZSkpCisJaWYgKHN3c3VzcF9wYWdlX2lzX2ZvcmJpZGRlbihwYWdlKSB8
fCBzd3N1c3BfcGFnZV9pc19mcmVlKHBhZ2UpIHx8CisJCVBhZ2VPZmZsaW5lKHBhZ2UpKQoKaW5z
dGVhZC4KCkl0J3MgYWRtaXR0ZWRseSBhIG5pdCBidXQgaXQganVzdCBzZWVtcyBjbGVhbmVyIHRv
IGVpdGhlciBkbyB0aGF0IG9yLCBpZiB5b3VyIGludGVudGlvbgp3YXMgdG8gc2VwYXJhdGUgdGhl
IFBhZ2UgY2hlY2tzIGZyb20gdGhlIHN3c3VzcCBjaGVja3MsIHRvIGJyZWFrIHRoZSBjYWxscyB0
bwpQYWdlUmVzZXJ2ZWQoKSBhbmQgUGFnZU9mZmxpbmUoKSBpbnRvIHRoZWlyIG93biBjaGVjayBp
biBzYXZlYWJsZV9oaWdobWVtX3BhZ2UoKS4KClRoYW5rcyEKICAgIC0tIEJpbGwKICAgICAKCj4g
T24gTm92IDE5LCAyMDE4LCBhdCAzOjE2IEFNLCBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gCj4gLS0tIGEva2VybmVsL3Bvd2VyL3NuYXBzaG90LmMKPiArKysg
Yi9rZXJuZWwvcG93ZXIvc25hcHNob3QuYwo+IEBAIC0xMjIyLDcgKzEyMjIsNyBAQCBzdGF0aWMg
c3RydWN0IHBhZ2UgKnNhdmVhYmxlX2hpZ2htZW1fcGFnZShzdHJ1Y3Qgem9uZSAqem9uZSwgdW5z
aWduZWQgbG9uZyBwZm4pCj4gCUJVR19PTighUGFnZUhpZ2hNZW0ocGFnZSkpOwo+IAo+IAlpZiAo
c3dzdXNwX3BhZ2VfaXNfZm9yYmlkZGVuKHBhZ2UpIHx8ICBzd3N1c3BfcGFnZV9pc19mcmVlKHBh
Z2UpIHx8Cj4gLQkgICAgUGFnZVJlc2VydmVkKHBhZ2UpKQo+ICsJICAgIFBhZ2VSZXNlcnZlZChw
YWdlKSB8fCBQYWdlT2ZmbGluZShwYWdlKSkKPiAJCXJldHVybiBOVUxMOwo+IAo+IAlpZiAocGFn
ZV9pc19ndWFyZChwYWdlKSkKPiBAQCAtMTI4Niw2ICsxMjg2LDkgQEAgc3RhdGljIHN0cnVjdCBw
YWdlICpzYXZlYWJsZV9wYWdlKHN0cnVjdCB6b25lICp6b25lLCB1bnNpZ25lZCBsb25nIHBmbikK
PiAJaWYgKHN3c3VzcF9wYWdlX2lzX2ZvcmJpZGRlbihwYWdlKSB8fCBzd3N1c3BfcGFnZV9pc19m
cmVlKHBhZ2UpKQo+IAkJcmV0dXJuIE5VTEw7Cj4gCj4gKwlpZiAoUGFnZU9mZmxpbmUocGFnZSkp
Cj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwo+IAlpZiAoUGFnZVJlc2VydmVkKHBhZ2UpCj4gCSAgICAm
JiAoIWtlcm5lbF9wYWdlX3ByZXNlbnQocGFnZSkgfHwgcGZuX2lzX25vc2F2ZShwZm4pKSkKPiAJ
CXJldHVybiBOVUxMOwo+IC0tIAo+IDIuMTcuMgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
