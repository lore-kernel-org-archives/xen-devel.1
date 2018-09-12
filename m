From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH 1/5] xentrace_format: print timestamps in
 nanoseconds
Date: Wed, 12 Sep 2018 19:44:15 +0300
Message-ID: <99c4e9b1-ea9b-83b8-556c-c09d67c962d6@epam.com>
References: <1536597679-8303-1-git-send-email-andrii.anisov@gmail.com>
 <1536597679-8303-2-git-send-email-andrii.anisov@gmail.com>
 <3e079a5d-6437-90a4-f313-e87b57f9b2bd@citrix.com>
 <732445b5-59cf-5416-455d-f994ee2aa47c@epam.com>
 <2fa12bbc-ace0-c75e-96bd-431cb4d49158@citrix.com>
 <c7b5a2df-0b25-845b-0f45-ae9060e2acd3@epam.com>
 <40a3fe50-187a-75de-3c38-1fdff0922d89@citrix.com>
 <2d70941bee81fbbedd5ffc2194ad40c6bdffd323.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <2d70941bee81fbbedd5ffc2194ad40c6bdffd323.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <george.dunlap@citrix.com>, Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gRGFyaW8sCgoKT24gMTIuMDkuMTggMTA6NDIsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+
IFNvcnJ5LCBJJ20gbm90IHN1cmUgSSdtIGdldHRpbmcgdGhpcyBwcm9wZXJseS4gV2hlbiB5b3Ug
c2F5ICJ3aXRoIHRoZQo+IGN1cnJlbnQgZm9ybXVsYSIsIGRvIHlvdSBtZWFuIGJlZm9yZSBvciBh
ZnRlciB0aGlzIHNlcmllcz8KSSBkaWQgbWVhbiB0aGUgZm9ybXVsYSBleGlzdGluZyBiZWZvcmUg
dGhpcyBzZXJpZXMuCgo+IElBQywgY2hhbmdpbmcgdGhlIGRlZmF1bHQgZm9ybWF0IGZpbGUgdGhh
dCB3ZSBzaGlwIHNvIHRoYXQgaXQgcHJpbnRzCj4gdGltZSBpbiB0aGUgZm9ybWF0IHNlY29uZHMu
bmFub3NlY29uZHMgKGlmIENQVSBzcGVlZCBpcyBzcGVjaWZpZWQpLAo+IHdvdWxkIGJlIG5pY2Ug
SU1PLgpPbiB0aGUgc2Vjb25kIHRob3VnaCBJIHJlYWxpemVkIGl0IGlzIHF1aXRlIGluY29udmVu
aWVudC4gRnJvbSB0aGUgCmZvcm1hdHMgZmlsZSB3ZSBjYW4ndCBkaXN0aW5ndWlzaCBpZiB0c2Mg
Y29udGFpbnMgZmxvYXQgc2VjLm5zIG9yIAppbnRlZ2VyIGN5Y2xlcy4gRm9yIGN5Y2xlcyBpdCB3
aWxsIGxvb2sgbGlrZSBmb2xsb3dpbmc6CgogICAgQ1BVMMKgIMKgwqDCoCDCoMKgwqAgMTA5MDY5
OTMwNS4wMDAwMDAwMDAgKCvCoMKgwqDCoCAzMzYpIHJ0ZHM6dGlja2xlwqDCoMKgwqDCoMKgwqAg
WwogICAgY3B1ID0gMCBdCgoKPiBBcyBzYWlkIGFscmVhZHksIHRoZSBvbmUgcmVhc29uIHdoeSBJ
IHRoaW5rCj4gaXQgc3RpbGwgY291bGQgYmUgdXNlZnVsLCBhbmQgd2Ugc2hvdWxkIGtlZXAgaXQs
IGlzIHRoYXQgdGhlIHdheSBhCj4gdHJhY2Ugd2lsbCBsb29rIGxpa2UgY2FuIGJlIGNoYW5nZWQg
b3IgdHdlYWtlZCByYXRoZXIgZWFzaWx5LCBhbmQKPiB3aXRob3V0IGhhdmluZyB0byByZWNvbXBp
bGUgYW55dGhpbmcsIHZpYSB0aGUgZm9ybWF0cyBmaWxlLCB3aGljaCBpcwo+IHJhdGhlciBjb29s
LiA6LSkKKzEKCi0tIAoKKkFuZHJpaSBBbmlzb3YqCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
