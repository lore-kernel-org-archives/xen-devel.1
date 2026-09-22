Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D323DC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:09:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428466.1651293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xQu-0006CK-A4; Tue, 22 Sep 2026 10:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428466.1651293; Tue, 22 Sep 2026 10:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xQu-0006CD-7C; Tue, 22 Sep 2026 10:09:04 +0000
Received: by outflank-mailman (input) for mailman id 1428466;
 Tue, 22 Sep 2026 10:09:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xQt-0006C5-LZ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:09:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQs-00Ao1o-2D;
 Tue, 22 Sep 2026 10:09:03 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQt-00DE8C-0Z;
 Tue, 22 Sep 2026 10:09:02 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From;
	bh=drharIiHk6QqThLjE77hRf70xicJ/qQxf9KOTnsZsJo=; b=pKL8ucXNrv46HWABhKHXocxTn9
	ZiQiHi7TmxSVhg8wKhTXMy/2c1fjkd4GkKIF/szVHr6YnS/HbuYMXtKjCKsfPAip8VfpGGH0EwD3M
	hQGu5f3lI/TCAzTixs+44Kcd6VVH6TRFnowNxpnCSjAjVxnEWwBLqaOnhWoMt3qzZ11A=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 00/13] Running bare-metal tests with "pytest"
Date: Tue, 22 Sep 2026 12:08:47 +0200
Message-ID: <20260922100900.29129-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Patch series available in this git branch:
https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git br.ci.bare-metal-with-pytest-v1

Hi,

I wanted to add some new machine to our GitLab CI, but I didn't want to
duplicate yet another time the existing shell script. They are good to get the
ball rolling but are getting harder to maintain as more test are been added,
and don't share common code between machines.

So, I've start work on something based on `pytest` which I hope will be easier
to maintain and extend and use to add new machines.

It's still Work In Progress.

Here is the current result:
    https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/16529107619

In this pipeline, the artifact use are a bit different from master; linux is
built with network driver, and vlan; the rootfs is from Marek's patch series,
with networking and dropbear service enabled.

Next:

I'd like to at least have a new fixture that give a started Host that a test
can ssh into. Then maybe a new class "Host" which could have functions for ssh
and getting the serial console output.

Don't go to much into detail review, I'm more interested of a general overview,
and to present what I have so far.

Some runes:
    - uv run mypy .
      to check the code, at least the types used.
      other code check could be added, and run by the pipeline
    - uv run pytest
      to run the whole test suite
    - uv run pytest test_boot.py::test_xen_tools_tests
      to run just one test

I did create an Arch Linux docker image with pytest, but paramiko got too new
to be used, so I've started to use `uv` to deal with the dependencies. `mypy`
always needed to be run with `uv` due to missing types for paramiko (not
packaged in Arch Linux). So the image is useless, and I'll look for a different
image later, for now just Arch Linux with `uv` installed.

Thanks,

Anthony PERARD (13):
  pytest: Add fixture to prepare rootfs
  Creating new python project
  pytest: Add fixture to prepare the tftp server
  pytest: Add fixture that boot a machine
  pytest: Introduce reading the console, and add a test
  We need an older version of paramiko.
  pytest: Add random string to look for in the logs
  pytest: Run run-tools-tests over ssh on the test machine
  pytest: Generate a rootfs for a guest
  pytest: Add guest test
  pytest: Add config to enable live log, and disable ssh/paramiko
    logging
  pytest: Add example .env for options for the tests
  gitlab-ci: Add job for moonshot with pytest

 automation/gitlab-ci/test.yaml       |  21 +++
 automation/pytest/.env               |  19 ++
 automation/pytest/conftest.py        |   6 +
 automation/pytest/lib/__init__.py    |   0
 automation/pytest/lib/boot_binary.py | 261 +++++++++++++++++++++++++++
 automation/pytest/lib/ipmi.py        | 155 ++++++++++++++++
 automation/pytest/lib/net_boot.py    |  60 ++++++
 automation/pytest/pyproject.toml     |  17 ++
 automation/pytest/pytest.toml        |  13 ++
 automation/pytest/test_boot.py       | 237 ++++++++++++++++++++++++
 10 files changed, 789 insertions(+)
 create mode 100644 automation/pytest/.env
 create mode 100644 automation/pytest/conftest.py
 create mode 100644 automation/pytest/lib/__init__.py
 create mode 100644 automation/pytest/lib/boot_binary.py
 create mode 100644 automation/pytest/lib/ipmi.py
 create mode 100644 automation/pytest/lib/net_boot.py
 create mode 100644 automation/pytest/pyproject.toml
 create mode 100644 automation/pytest/pytest.toml
 create mode 100644 automation/pytest/test_boot.py

-- 
Anthony PERARD


