From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 00/12] Improvements to domain creation
Date: Tue, 14 Aug 2018 14:34:43 +0100
Message-ID: <f00f1b0b-b602-8fa4-d304-e4c309f26bbd@citrix.com>
References: <1534154469-6076-1-git-send-email-andrew.cooper3@citrix.com>
 <abce7ca5-c443-3cf1-81fb-4c63bc9d9b68@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <abce7ca5-c443-3cf1-81fb-4c63bc9d9b68@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Jon Ludlam <jonathan.ludlam@eu.citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, David Scott <dave@recoil.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDgvMTggMTQ6MTIsIENocmlzdGlhbiBMaW5kaWcgd3JvdGU6Cj4KPiBPbiAxMy8wOC8x
OCAxMTowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhpcyBzZXJpZXMgY2FuIGJlIGZvdW5k
IGluIGdpdCBmb3JtIGhlcmU6Cj4+IMKgwqAKPj4gaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9cGVvcGxlL2FuZHJld2Nvb3AveGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy94
ZW4tY3JlYXRlLXYxCj4gSXMgdGhpcyB0aGUgY29ycmVjdCBVUkw/IFRoZSBzdWJqZWN0IHNheXMg
djIgYnV0IHRoaXMgaXMgYnJhbmNoIHYxLgoKT29wcyB5ZXMuCgpodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD1wZW9wbGUvYW5kcmV3Y29vcC94ZW4uZ2l0O2E9c2hvcnRsb2c7aD1yZWZz
L2hlYWRzL3hlbi1jcmVhdGUtdjIKd29ya3MgYXMgd2VsbCwgYW5kIGlzIHRoZSBpbnRlbmRlZCBV
UkwuCgo+Cj4gTG9va2luZyBvdmVyIHRoZSBPQ2FtbC1yZWxhdGVkIHBhdGNoZXMsIEkgdGhpbmsg
dGhleSBhcmUgbG9va2luZyBnb29kLgo+IFNpbmNlIHdlIHdvdWxkIGxpa2UgYWxsIGNvZGUgdG8g
YmUgc2FmZS1zdHJpbmcgY29tcGxpYW50IEkgY2hlY2tlZAo+IHRoYXQgT0NhbWwgdmFsdWVzIG9m
IHR5cGUgc3RyaW5nIGFyZSBub3QgYmVpbmcgbXV0YXRlZCBidXQgSSB3b3VsZAo+IGxpa2UgQW5k
cmV3IHRvIGNvbmZpcm0gdGhpcy4KClRoZXJlIGlzIG5vIGNoYW5nZSB0byBhbnkgc3RyaW5nIGhh
bmRsaW5nIGhlcmUuwqAgVGhlIG9ubHkgc3RyaW5nIHVzZWQKZHVyaW5nIHRoZSBkb21haW5jcmVh
dGUgaHlwZXJjYWxsIGlzIHRoZSBVVUlEIHN0cmluZywgd2hpY2ggaXMgb25seSByZWFkCmJ5IHRo
ZSBzdHVicywgbm90IGFsdGVyZWQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
