From: "Xin Li (Talons)" <xin.li@citrix.com>
Subject: Re: [PATCH 1/3] xen/xsm: remove unnecessary #define
Date: Tue, 9 Oct 2018 07:50:04 +0000
Message-ID: <56ab33751a224203bd79c4ee09b77b03@SINPEX02CL01.citrite.net>
References: <20181009002831.22678-1-xin.li@citrix.com>
 <5BBC51B402000078001EFD3C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BBC51B402000078001EFD3C@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Xin Li <talons.lee@gmail.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

PiA+IC0tLQo+ID4gQ0M6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292Pgo+
ID4gQ0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiA+IEND
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gPiBDQzogS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+ID4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+IENDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9y
Zz4KPiA+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gQ0M6IFNlcmdleSBE
eWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiA+IENDOiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gQ0M6IE1pbmcgTHUgPG1pbmcubHVAY2l0cml4
LmNvbT4KPiA+Cj4gPiB2NToKPiA+IDEuIG1vdmUgdGhlIHJlbW92YWwgb2YgI2RlZmluZSB0byB0
aGlzIG5ldyBwYXRjaC4KPiA+IDIuIGZpeCB3cm9uZyBnaXQgYXV0aG9yCj4gCj4gT2gsIGFuZCBw
bGVhc2UsIHdoZW4geW91IHNlbmQgbmV3IHZlcnNpb25zLCBhZGQgcHJldmlvdXNseSBwcm92aWRl
ZCAob2YKPiBjb3Vyc2UgdW5sZXNzIHRoZXkndmUgYmVlbiBpbnZhbGlkYXRlZCBtZWFud2hpbGUp
IHRhZ3MsIHRvIGFpZCBib3RoIGNvbW1pdHRlcnMKPiBhbmQgZnV0dXJlIHJlYWRlcnMvcmV2aWV3
ZXJzLgo+IApEbyB5b3UgbWVhbiBhbGwgdGhlIGNoYW5nZXMgZnJvbSB2MSB0byB2NSwgbGlrZToK
CnYxOgp4eHgKCnYyOgp4eHgKLi4KCnY1Cgo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
