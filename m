From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xenstore: increase default thread stack
 size to 32k
Date: Thu, 22 Feb 2018 12:53:02 +0100
Message-ID: <a9218f64-4c66-0b77-d5d2-f450dddf2ca6@suse.com>
References: <20180221221341.17452-1-jfehlig@suse.com>
 <23182.42661.155867.810718@mariner.uk.xensource.com>
 <20180222113521.skuzd3otv7xquvmu@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=d841=fq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eopR4-00039I-C2
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 11:53:14 +0000
In-Reply-To: <20180222113521.skuzd3otv7xquvmu@MacBook-Pro-de-Roger.local>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jim Fehlig <jfehlig@suse.com>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMTggMTI6MzUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVGh1LCBGZWIg
MjIsIDIwMTggYXQgMTE6MTY6NTNBTSArMDAwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4+IEppbSBG
ZWhsaWcgd3JpdGVzICgiW1BBVENIXSB4ZW5zdG9yZTogaW5jcmVhc2UgZGVmYXVsdCB0aHJlYWQg
c3RhY2sgc2l6ZSB0byAzMmsiKToKPj4+IE9uIHNldmVyYWwgU2t5bGFrZSBtYWNoaW5lcyBJJ3Zl
IG9ic2VydmVkIHhsIHNlZ2ZhdWx0cyB3aGVuIHJ1bm5pbmcKPj4+IGNyZWF0ZSBvciBkZXN0cm95
IHN1YmNvbW1hbmRzLiBPdGhlciBzdWJjb21tYW5kcyBtYXkgc2VnZmF1bHQgdG9vLAo+Pj4gYnV0
IEkndmUgb25seSBsb29rZWQgYXQgY3JlYXRlIGFuZCBkZXN0cm95IHdoaWNoIHNoYXJlIGEgc2lt
aWxhcgo+Pj4gYmFja3RyYWNlCj4+Cj4+IEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KPj4KPj4gSG93ZXZlciwgSSBhbSBjb25jZXJuZWQgdGhhdCB0aGlz
IGlzbid0IGEgdmVyeSBzeXN0ZW1hdGljIHdheSBvZgo+PiBhZGRyZXNzaW5nIHRoaXMgcHJvYmxl
bS4gIEhvdyBkbyB3ZSBrbm93IHRoYXQgMzJLIGlzIGVub3VnaCA/Cj4+IFdlIGhhdmUgYWxyZWFk
eSBpbmNyZWFzZWQgdGhpcyBudW1iZXIgb25jZS4KPj4KPj4gQWx0ZXJuYXRpdmVseSwgbWF5YmUg
dGhpcyBpYSBhIGJ1ZyBpbiB0aGUgcGxhdGZvcm0gbGliYyA/Cj4gCj4gSXMgaXQgcmVhbGx5IHRo
YXQgYmFkIHRvIHVzZSB0aGUgZGVmYXVsdCB0aHJlYWQgc3RhY2sgc2l6ZT8gVGhhdCdzCj4gZ29p
bmcgdG8gYmUgbXVjaCBiaWdnZXIsIEkga25vdywgYnV0IEkgYXNzdW1lIHBoeXNpY2FsIG1lbW9y
eSBmb3IgdGhlCj4gc3RhY2sgd2lsbCBiZSBtYXBwZWQgb24gZGVtYW5kLCBhbmQgdGh1cyB0aGUg
cGh5c2ljYWwgbWVtb3J5IHVzYWdlIGlzCj4gbm90IGdvaW5nIHRvIGJlIHRoYXQgZGlmZmVyZW50
Lgo+IAo+IEkndmUgYmVlbiBhbHdheXMgdG9sZCB0byBzaW1wbHkgbm90IHBsYXkgd2l0aCB0aGUg
c3RhY2sgc2l6ZS4KClZpcnR1YWwgbWVtb3J5IGlzbid0IHVubGltaXRlZCwgZXNwZWNpYWxseSBp
biAzMiBiaXQgcHJvZ3JhbXMuCgpJdCBpcyBwb3NzaWJsZSB0byBkbyBhIGhhY2sgZm9yIG9idGFp
bmluZyB0aGUgX2ZyZWVfIHN0YWNrIHNwYWNlIGluIGEKdGhyZWFkLCBldmVuIGlmIGl0IGlzbid0
IHJlYWxseSBiZWF1dGlmdWwgYW5kIHJlbHlpbmcgb24gYSBub24tc3RhbmRhcmQKR05VIGV4dGVu
c2lvbiAocHRocmVhZF9nZXRhdHRyX25wKCkpLiBJdCB3b3VsZCByZXF1aXJlIGNyZWF0aW5nIGEg
dGVzdAp0aHJlYWQgbG9va2luZyBob3cgbXVjaCBzcGFjZSBpcyBsZWZ0IG9uIHRoZSBzdGFjayBh
bmQgc2l6ZSB0aGUgd2F0Y2gncwp0aHJlYWQgc3RhY2sgYWNjb3JkaW5nbHkuCgoKSnVlcmdlbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
