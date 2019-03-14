From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen: introduce a cpumask with all bits
 set
Date: Thu, 14 Mar 2019 11:08:24 +0100
Message-ID: <9dcc617d-4b2d-b67d-50c5-e86d6367fff1@suse.com>
References: <20190314095953.11752-1-jgross@suse.com>
 <20190314095953.11752-2-jgross@suse.com>
 <37e7beea-3bfe-4695-7ced-3ee1690d1af7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4NHp-0001d6-Ux
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 10:08:29 +0000
In-Reply-To: <37e7beea-3bfe-4695-7ced-3ee1690d1af7@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxMTowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNC8wMy8yMDE5
IDA5OjU5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBUaGVyZSBhcmUgc2V2ZXJhbCBwbGFjZXMg
aW4gWGVuIGFsbG9jYXRpbmcgYSBjcHVtYXNrIG9uIHRoZSBzdGFjayBhbmQKPj4gc2V0dGluZyBh
bGwgYml0cyBpbiBpdCBqdXN0IHRvIHVzZSBpdCBhcyBhbiBpbml0aWFsIG1hc2sgZm9yIGFsbG93
aW5nCj4+IGFsbCBjcHVzLgo+Pgo+PiBTYXZlIHRoZSBzdGFjayBzcGFjZSBhbmQgb21pdCB0aGUg
bmVlZCBmb3IgcnVudGltZSBpbml0aWFsaXphdGlvbiBieQo+PiBkZWZpbmluZyBhIGdsb2JhbGx5
IGFjY2Vzc2libGUgY3B1bWFza19hbGwgdmFyaWFibGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4sIHdpdGggb25lIG1pbm9yCj4gc3R5bGUg
c3VnZ2VzdGlvbnMgd2hpY2ggY2FuIGJlIGZvbGRlZCBvbiBjb21taXQuCj4gCj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jIGIveGVuL2FyY2gveDg2L2lvX2FwaWMuYwo+PiBp
bmRleCBkYWE1ZTllNWZmLi5hNTM0NGVkNzI3IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
aW9fYXBpYy5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMKPj4gQEAgLTE4OTIsOCAr
MTg5MSw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjaGVja190aW1lcih2b2lkKQo+PiAgICAgIHZl
Y3RvciA9IElSUTBfVkVDVE9SOwo+PiAgICAgIGNsZWFyX2lycV92ZWN0b3IoMCk7Cj4+ICAKPj4g
LSAgICBjcHVtYXNrX3NldGFsbCgmbWFza19hbGwpOwo+PiAtICAgIGlmICgocmV0ID0gYmluZF9p
cnFfdmVjdG9yKDAsIHZlY3RvciwgJm1hc2tfYWxsKSkpCj4+ICsgICAgaWYgKChyZXQgPSBiaW5k
X2lycV92ZWN0b3IoMCwgdmVjdG9yLCAmY3B1bWFza19hbGwpKSkKPiAKPiBTcGFjZXMsIHNlZWlu
ZyBhcyB3ZSdyZSBtb2RpZnlpbmcgdGhlIGxpbmUuCgpZb3UgYXJlIGF3YXJlIHRoaXMgZmlsZSBv
cmlnaW5hdGVzIGZyb20gdGhlIExpbnV4IGtlcm5lbD8KCkkgcmVhbGx5IGRvbid0IG1pbmQgZWl0
aGVyIHdheSwgSSBqdXN0IHdhbnRlZCB0byBtZW50aW9uIGl0Li4uCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
