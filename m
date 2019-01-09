From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 13/25] argo: implement the register op
Date: Wed, 9 Jan 2019 18:48:06 +0200
Message-ID: <d71b17a9-0ff9-5c48-db96-33bef501d3e0@bitdefender.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-14-git-send-email-christopher.w.clark@gmail.com>
 <20181212164721.hag6gc3akcm2gvhd@mac>
 <CACMJ4GZRAck4oYtXJpV3c_tGer0n+EUuWjXCtcjLbySOs0W78w@mail.gmail.com>
 <20181220125218.75t3cr3ehc6e4u6n@mac.citrite.net>
 <CACMJ4GaG8kZBkcFiEWMi_ENdJ4uX=c2YxFpgu_sKjUab7618dA@mail.gmail.com>
 <20190104085704.ga7wsqonhbzpv5as@mac.bytemobile.com>
 <5C2F5E0B020000780020A37A@prv1-mh.provo.novell.com>
 <20190104153555.cfjx5mofw6mjbudh@mac.bytemobile.com>
 <5C2F7FF8020000780020A495@prv1-mh.provo.novell.com>
 <20190107085912.gd5bp6y35drjg5gr@mac>
 <CABfawhmfhYkHreJ3A4xnmhJjW3581Zt0L5-Vsswz93ZZTMrFQw@mail.gmail.com>
 <CAPLaKK4nijCrfATvUXNf8MR8cfFHCA0Zk9mYmp0kYj96c4V9Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mb6b=PR=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1ghH1W-0001OR-1q
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 16:48:10 +0000
In-Reply-To: <CAPLaKK4nijCrfATvUXNf8MR8cfFHCA0Zk9mYmp0kYj96c4V9Qg@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@freebsd.org>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, Christopher Clark <christopher.w.clark@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, eric chanudet <eric.chanudet@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMS85LzE5IDY6MzQgUE0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE1heWJlIHRo
aXMgaXMgdXNlLWNhc2UgaXMgZGlmZmVyZW50LCBidXQgaG93IGRvZXMgaW50cm9zcGVjdGlvbiBo
YW5kbGUKPj4+Pj4gYWNjZXNzZXMgdG8gdGhlIHNoYXJlZCBpbmZvIHBhZ2Ugb3IgdGhlIHJ1bnN0
YXRlIGluZm8gZm9yIGV4YW1wbGU/Cj4+Pj4+Cj4+Pj4+IEkgd291bGQgY29uc2lkZXIgYXJnbyB0
byBiZSB0aGUgc2FtZSBpbiB0aGlzIHJlZ2FyZC4KPj4+Pgo+Pj4+IE5vdCBleGFjdGx5OiBUaGUg
c2hhcmVkIGluZm8gcGFnZSBpcyBzcGVjaWFsIGluIGFueSBldmVudC4gRm9yCj4+Pj4gcnVuc3Rh
dGUgaW5mbyAoYW5kIGFsaWtlIC0gdGhlcmUncyBhbHNvIHN0cnVjdCB2Y3B1X3RpbWVfaW5mbykK
Pj4+PiBJJ2QgcXVlc3Rpb24gY29ycmVjdG5lc3Mgb2YgdGhlIGN1cnJlbnQgaGFuZGxpbmcuIElm
IHRoYXQncwo+Pj4+IHdyb25nIGFscmVhZHksIEknZCBwcmVmZXIgaWYgdGhlIGlzc3VlIHdhc24n
dCBzcHJlYWQuCj4+Pgo+Pj4gVGhlcmUgYXJlIGFsc28gZ3JhbnRzLCB3aGljaCB3aGVuIHVzZWQg
dG9nZXRoZXIgd2l0aCBhbm90aGVyIGd1ZXN0IG9uCj4+PiB0aGUgc2FtZSBob3N0IGNvdWxkIGFs
bG93IHRvIGJ5cGFzcyBpbnRyb3NwZWN0aW9uIEFGQUlDVD8gKHVubGVzcwo+Pj4gdGhlcmUncyBz
b21lIHBvbGljeSBhcHBsaWVkIHRoYXQgbGltaXQgZ3JhbnQgc2hhcmluZyB0byB0cnVzdGVkCj4+
PiBkb21haW5zKQo+Pj4KPj4+IFRCSCBJJ20gbm90IHN1cmUgaG93IHRvIGhhbmRsZSBoeXBvZXJ2
aXNvciBhY2Nlc3NlcyB3aXRoCj4+PiBpbnRyb3NwZWN0aW9uLiAgTXkga25vd2xlZGdlIG9mIGlu
dHJvc3BlY3Rpb24gaXMgZmFpcmx5IGxpbWl0ZWQsIGJ1dAo+Pj4gaXQgcGF1c2VzIHRoZSBndWVz
dCBhbmQgc2VuZHMgYSBub3RpZmljYXRpb24gdG8gYW4gaW4gZ3Vlc3QgYWdlbnQuIEknbQo+Pj4g
bm90IHN1cmUgdGhpcyBpcyBhcHBsaWNhYmxlIHRvIGh5cGVydmlzb3Igd3JpdGVzLCBzaW5jZSBp
dCdzIG5vdAo+Pj4gcG9zc2libGUgdG8gcGF1c2UgaHlwZXJ2aXNvciBleGVjdXRpb24gYW5kIHdh
aXQgZm9yIGEgcmVzcG9uc2UgZnJvbSBhCj4+PiBndWVzdCBhZ2VudC4KPj4+Cj4+Cj4+IEludHJv
c3BlY3Rpb24gYXBwbGljYXRpb25zIG9ubHkgY2FyZSBhYm91dCBtZW1vcnkgYWNjZXNzZXMgcGVy
Zm9ybWVkCj4+IGJ5IHRoZSBndWVzdC4gSHlwZXJ2aXNvciBhY2Nlc3NlcyB0byBtb25pdG9yZWQg
cGFnZXMgYXJlIG5vdCBpbmNsdWRlZAo+PiB3aGVuIG1vbml0b3JpbmcgLSBpdCBpcyBhY3R1YWxs
eSBhIGZlYXR1cmUgd2hlbiB1c2luZyB0aGUgZW11bGF0b3IgaW4KPj4gWGVuIHRvIGNvbnRpbnVl
IGd1ZXN0IGV4ZWN1dGlvbiBiZWNhdXNlIHRoZSBoeXBlcnZpc29yIGlnbm9yZXMgRVBUCj4+IG1l
bW9yeSBwZXJtaXNzaW9ucyB0aGF0IHRyaXAgdGhlIGd1ZXN0IGZvciBpbnRyb3NwZWN0aW9uLiBT
byBoYXZpbmcKPj4gdGhlIGh5cGVydmlzb3IgYWNjZXNzIG1lbW9yeSBvciBhIGdyYW50LXNoYXJl
ZCBwYWdlIGJlaW5nIGFjY2Vzc2VkIGluCj4+IGFub3RoZXIgZG9tYWluIGFyZSBub3QgYSBwcm9i
bGVtIGZvciBpbnRyb3NwZWN0aW9uLgo+IAo+IENhbid0IHRoZW4gdHdvIGd1ZXN0cyBydW5uaW5n
IG9uIHRoZSBzYW1lIGhvc3QgYmUgYWJsZSB0byBjb21wbGV0ZWx5Cj4gYnlwYXNzIGludHJvc3Bl
Y3Rpb24/IEkgZ3Vlc3MgeW91IHByZXZlbnQgdGhpcyBieSBsaW1pdGluZyB0byB3aGljaAo+IGd1
ZXN0cyBwYWdlcyBjYW4gYmUgc2hhcmVkPwoKV291bGQgdGhlc2UgdHdvIGd1ZXN0cyBiZSBIVk0g
Z3Vlc3RzPyBJbnRyb3NwZWN0aW9uIG9ubHkgd29ya3MgZm9yIEhWTSAKZ3Vlc3RzLiBJJ20gbm90
IHN1cmUgSSBmb2xsb3cgeW91ciBzY2VuYXJpbyB0aG91Z2guIEhvdyB3b3VsZCB0aGVzZSAKZ3Vl
c3RzIGNvbGxhYm9yYXRlIHRvIGVzY2FwZSBpbnRyb3NwZWN0aW9uIHZpYSBncmFudHM/Cgo+IElm
IHRoYXQncyB0aGUgY2FzZSwgYW5kIGludHJvc3BlY3Rpb24gZG9lc24ndCBjYXJlIGFib3V0IGh5
cGVydmlzb3IKPiBhY2Nlc3NlcyB0byBndWVzdCBwYWdlcywgdGhlbiBqdXN0IGdldHRpbmcgYSBy
ZWZlcmVuY2UgdG8gdGhlCj4gdW5kZXJseWluZyBwYWdlIHdoZW4gdGhlIHJpbmcgaXMgc2V0dXAg
c2hvdWxkIGJlIGVub3VnaC4gVGhlcmUncyBubwo+IG5lZWQgdG8gY2hlY2sgdGhlIGdmbiAtPiBt
Zm4gcmVsYXRpb24gZXZlcnkgdGltZSB0aGVyZSdzIGFuIGh5cGVydmlzb3IKPiBhY2Nlc3MgdG8g
dGhlIHJpbmcuCgpJIHRoaW5rIHNvLCBidXQgSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZy4K
CgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
