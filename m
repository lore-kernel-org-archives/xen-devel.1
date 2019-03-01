From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-next] CODING_STYLE: Document how to
 handle unexpected conditions
Date: Fri, 1 Mar 2019 17:14:24 +0000
Message-ID: <20190301171424.2mnkgqyvlxls3vvq@zion.uk.xensource.com>
References: <20190228184905.9377-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LSBC=RE=citrix.com=prvs=95619bba3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gzljx-0005xE-Ch
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2019 17:14:29 +0000
Content-Disposition: inline
In-Reply-To: <20190228184905.9377-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjgsIDIwMTkgYXQgMDY6NDk6MDVQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBJdCdzIG5vdCBhbHdheXMgY2xlYXIgd2hhdCB0aGUgYmVzdCB3YXkgaXMgdG8gaGFu
ZGxlIHVuZXhwZWN0ZWQKPiBjb25kaXRpb25zOiB3aGV0aGVyIHdpdGggQVNTRVJUKCksIEJVR19P
TigpLCBvciBzb21lIG90aGVyIG1ldGhvZC4KPiBBbGwgbWV0aG9kcyBoYXZlIGEgcmlzayBvZiBp
bnRyb2R1Y2luZyBzZWN1cml0eSB2dWxuZXJhYmlsaXRpZXMgYW5kCj4gdW5uZWNlc3NhcnkgaW5z
dGFiaWxpdGllcyB0byBwcm9kdWN0aW9uIHN5c3RlbXMuCj4gCj4gRG9jdW1lbnQgd2hlbiB0byB0
cnkgdG8gcmV0dXJuIGFuIGVycm9yIGZvciB1bmV4cGVjdGVkIGNvbmRpdGlvbnMsCj4gd2hlbiB0
byB1c2UgQlVHX09OKCksIGFuZCB3aGVuIHRvIHVzZSBBU1NFUlQoKS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgo+IENDOiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgo+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFRpbSBE
ZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENDOiBLb25yYWQgV2lsayA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT4KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+
IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICBDT0RJTkdf
U1RZTEUgfCA3OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL0NPRElOR19TVFlMRSBiL0NPRElOR19TVFlMRQo+IGluZGV4IDZjYzViNzc0Y2YuLjUxMTU5
OTcwYzAgMTAwNjQ0Cj4gLS0tIGEvQ09ESU5HX1NUWUxFCj4gKysrIGIvQ09ESU5HX1NUWUxFCj4g
QEAgLTEyMCwzICsxMjAsODIgQEAgdGhlIGVuZCBvZiBmaWxlcy4gIEl0IHNob3VsZCBiZToKPiAg
ICogaW5kZW50LXRhYnMtbW9kZTogbmlsCj4gICAqIEVuZDoKPiAgICovCj4gKwo+ICtIYW5kbGlu
ZyB1bmV4cGVjdGVkIGNvbmRpdGlvbnMKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gKwo+ICtHVUlERUxJTkVTOgo+ICsKPiArUGFzc2luZyBlcnJvcnMgdXAgdGhlIHN0YWNrIHNo
b3VsZCBiZSB1c2VkIHdoZW4gdGhlIGNhbGxlciBpcyBhbHJlYWR5Cj4gK2V4cGVjdGluZyB0byBo
YW5kbGUgZXJyb3JzLCBhbmQgdGhlIHN0YXRlIHdoZW4gdGhlIGVycm9yIHdhcwo+ICtkaXNjb3Zl
cmVkIGlzbuKAmXQgYnJva2VuLCBvciB0b28gaGFyZCB0byBmaXguCgpJZiB0aGUgZXJyb3IgaXMg
dG9vIGhhcmQgdG8gZml4LCB3aGF0IHNob3VsZCB0aGUgY2FsbGVyIGRvIGFmdGVyIGdldHRpbmcK
YW4gZXJyb3I/IFNob3VsZCBYZW4gY29udGludWUgd2l0aCBzdWNoIGJyb2tlbiBzdGF0ZT8KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
