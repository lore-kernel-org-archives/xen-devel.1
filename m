From: Julien Grall <julien.grall@arm.com>
Subject: Re: [for-4.11][PATCH v7 16/16] xen: Convert page_to_mfn
 and mfn_to_page to use typesafe MFN
Date: Fri, 6 Apr 2018 09:19:03 +0100
Message-ID: <801482b0-519c-44b3-6601-c7e73aecf4f9@arm.com>
References: <20180403153251.19595-1-julien.grall@arm.com>
 <20180403153251.19595-17-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180403153251.19595-17-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Gang Wei <gang.wei@intel.com>, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNC8wMy8yMDE4IDA0OjMyIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gICB4ZW4v
YXJjaC94ODYvaHZtL2lvcmVxLmMgICAgICAgICAgICAgICAgfCAgNCArKy0tCgpUaGVyZSBpcyBh
IHNtYWxsIGNsYXNoIHdpdGggUGF1bCdzIEdGTiB0eXBlc2FmZSBmb3IgaW9yZXEuIApQYXVsLCBk
byB5b3Ugd2FudCBtZSB0byByZXNlbmQgYSBwYXRjaCBmb3IgdGhhdD8KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
