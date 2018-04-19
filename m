From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] x86: Fix possible ASSERT(cpu <
 nr_cpu_ids)
Date: Thu, 19 Apr 2018 15:24:32 +0200
Message-ID: <9848d1d4-b56e-e299-30f1-fd30b60b2a77@suse.com>
References: <1524133246-3196-1-git-send-email-Davidwang@zhaoxin.com>
 <5AD8872302000078001BCA98@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gvlu=hi=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f99YC-00055y-P9
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 13:24:36 +0000
In-Reply-To: <5AD8872302000078001BCA98@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Davidwang <Davidwang@zhaoxin.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Fiona Li(BJ-RD)" <FionaLi@zhaoxin.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDQvMTggMTQ6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjA0LjE4IGF0
IDEyOjIwLCA8RGF2aWR3YW5nQHpoYW94aW4uY29tPiB3cm90ZToKPj4gRnJvbTogRGF2aWQgV2Fu
ZyA8ZGF2aWR3YW5nQHpoYW94aW4uY29tPgo+Pgo+PiBDUFVzIG1heSBzaGFyZSBhbiBpbi11c2Ug
Y2hhbm5lbC4gSGVuY2UgY2xlYXJpbmcgb2YgYSBiaXQgZnJvbQo+PiB0aGUgY3B1bWFzayAoaW4g
aHBldF9icm9hZGNhc3RfZXhpdCgpKSBhcyB3ZWxsIGFzIHNldHRpbmcgb25lCj4+IChpbiBocGV0
X2Jyb2FkY2FzdF9lbnRlcigpKSBtdXN0IG5vdCByYWNlIGV2YWx1YXRpb24gb2YgdGhhdCBzYW1l
Cj4+IGNwdW1hc2suIFRoZXJlZm9yZSBhdm9pZCBldmFsdWF0aW5nIHRoZSBjcHVtYXNrIHR3aWNl
IGluCj4+IGhwZXRfZGV0YWNoX2NoYW5uZWwoKS4gT3RoZXJ3aXNlIGNwdW1hc2tfZW1wdHkoKSBt
YXkgZS5nLnJldHVybgo+PiBmYWxzZSB3aGlsZSB0aGUgc3Vic2VxdWVudCBjcHVtYXNrX2ZpcnN0
KCkgY291bGQgcmV0dXJuIG5yX2NwdV9pZHMsCj4+IHdoaWNoIHRoZW4gdHJpZ2dlcnMgdGhlIGFz
c2VydGlvbiBpbiBjcHVtYXNrX29mKCkgcmVhY2hlZCB0aHJvdWdoCj4+IHNldF9jaGFubmVsX2ly
cV9hZmZpbml0eSgpLgo+Pgo+PiBTaWduLW9mZi1ieTogRGF2aWQgV2FuZyA8ZGF2aWR3YW5nQHpo
YW94aW4uY29tPgo+IAo+IFNpZ25lZC1vZmYtYnkKClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
